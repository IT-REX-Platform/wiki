# Backend testing

Description of how the backend / different microservices will be tested.  

## Unit testing

We use [JUnit5](https://junit.org/junit5/) for unit testing,
[Mockito](https://site.mockito.org/) for mocking and
[Hamcrest](http://hamcrest.org/JavaHamcrest/) for assertions.

### What to test

We test all classes that contain logic. This means that we do not test classes that only contain getters and setters
and controllers that only contain a single method that calls a service method.

Typically, we test the `Service` classes of the microservices, but if other classes contain non-trivial logic, we
also test those, for example if a repository class contains a custom query.

### How to test

Unit tests test a single class in isolation. This means that we mock all dependencies of the class under test. 
That implies, that a unit test **may not** use the database or the spring application context.

There are a few guidelines for unit tests:
- Each test method should test a single responsibility of the class under test, under a single condition, e.g. a successful creation of a user.
- Each test method should be independent of other test methods, i.e. the order of execution should not matter.
- Ideally, every path of the method under test should be tested, i.e. every special case or exceptional path.

A good way to structure a unit test is the following:
- Arrange: Create the class under test and all dependencies, set up the dependencies to return the expected values.
- Act: Call the method under test.
- Assert: Assert that the expected result is returned.

Helpful guides:
- [JUnit5 User Guide](https://junit.org/junit5/docs/current/user-guide/)
- [Hamcrest Tutorial](http://hamcrest.org/JavaHamcrest/tutorial)

### Mocking

If a dependency is a very simple class, for example an object mapper, we may use the real class instead of mocking it.
Otherwise, we would have to mock so much that the test would become unreadable and hard to maintain.

We use [Mockito](https://site.mockito.org/) for mocking. It allows us to mock classes and interfaces and to verify
that certain methods were called on the mock.

### Naming conventions

There are no strict naming conventions for unit tests. However, the test method should describe what is tested and
what the expected result is. For example, if we test the delete method of the `UserService`, we could name the test
method `testDeleteExistingUser()`.
Other approaches put the expected result in the test method name, for example `deleteUser_UserExists_UserDeleted()`,
but this often leads to very long test method names.

We therefore prefer to put the expected result in the JavaDoc of the test method:
The JavaDoc of the test method should describe what is tested and what the expected result is, after the given
pattern: `Given <some context>, when <some action is taken>, then <some result is expected>`.

### Example

```java
public class ChapterServiceTest {
    /**
     * Given a valid ChapterId
     * When deleteChapter is called
     * Then the UUID is returned and the delete method of the repository is called
     */
    @Test
    public void testDeleteChapterSuccessful() {
        // arrange test data
        UUID testChapterId = UUID.randomUUID();

        // mock repository
        doNothing()
                .when(chapterRepository).deleteById(any());
        doReturn(true)
                .when(chapterRepository).existsById(any());

        // act
        UUID deletedChapterId = chapterService.deleteChapter(testChapterId);

        // assert
        assertThat(deletedChapterId, is(testChapterId));

        // verify that the repository was called
        verify(chapterRepository).deleteById(testChapterId);
    }
}
```

## Integration/API testing

As our microservices are rather small, we do API testing instead of what is usually referred to as integration testing.
This means that we test the graphQL API of the microservices instead of interaction of classes in the microservice.
Having integration tests in addition to unit tests and API tests would be redundant, as the API tests already test
the interaction of the classes and the database.

Of course, if it makes sense to have integration tests in addition in some cases, we can always add them.

### What to test

We test the graphQL API of the microservices. This means that we test the graphQL queries and mutations that are
exposed by the microservice. As in unit tests, think of all special cases and exceptional paths that should be tested.

If a functionality is tests in detail in a unit test, it might be acceptable to not test it again in that much detail in an API
test. However, even if your unit tests test the complete functionality, an integration test might be necessary to test the database related aspects like database constraints. So in case of doubt, it is better to have an API test that tests the same functionality again.

### How to test

We provide the `GraphQlApiTest` annotation that sets up the test environment for API tests. 
It starts the spring application context and requires the database to be running. 

Each test can use a `GraphQlTester` as a method parameter. The `GraphQlTester` provides methods to execute graphQL
queries and mutations and to assert the result.

Before the tests, the database is cleared. It is therefore necessary that aach test sets up the test data that 
is required for the test.
All test data is deleted after the test, so that the tests are independent of each other.
This is done with the `ClearDatabase` extension that is automatically registered by the `GraphQlApiTest` annotation.

### Example

```java
@GraphQlApiTest
public class Test {

    @Test
    public void testCreateCourse(GraphQlTester tester) {
        String query = """
                mutation {
                    createCourse(
                        input: {
                            title: "New Course"
                            description: "This is a new course"
                            startDate: "2020-01-01T00:00:00.000Z"
                            endDate: "2021-01-01T00:00:00.000Z"
                            published: false
                        }
                    ) {
                        id
                        title
                        description
                        startDate
                        endDate
                        published
                        chapters {
                            id
                        }
                    }
                }""";

        tester.document(query)
                .execute()
                .path("createCourse.title").entity(String.class).isEqualTo("New Course")
                .path("createCourse.description").entity(String.class).isEqualTo("This is a new course")
                .path("createCourse.startDate").entity(String.class).isEqualTo("2020-01-01T00:00:00.000Z")
                .path("createCourse.endDate").entity(String.class).isEqualTo("2021-01-01T00:00:00.000Z")
                .path("createCourse.chapters").entityList(String.class).hasSize(0)
                .path("createCourse.published").entity(Boolean.class).isEqualTo(false);
    }
}
```

