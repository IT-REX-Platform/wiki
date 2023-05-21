# Sorting, Filtering, and Pagination

Each query in the microservices and queries a collection of data should offer **sorting**, **filtering**, and **pagination**.
In this document, we will explain how to implement these features in the backend and in the graphql schema.

## GraphQL Schema

A query for a collection of data should have the following arguments:

- `sortBy: [String!]!`: The fields to sort by. The order of the fields is important. The first field is the primary sort
  field, the second field is the secondary sort field, etc.
- `sortDirection: [SortDirection!]!`: The direction to sort by. Either `ASC` or `DESC`.
    - The order of the directions is important. The first direction is the direction for the first field, the second
      direction is the direction for the second field, etc.
    - If the length of `sortDirection` is less than the length of `sortBy` or not given at all, the remaining fields
      will be sorted in **ascending** order.
    - The SortDirection enum is defined in the common graphQL schema, included in the template microservice.
- `filter: <nameOfTheObject>Filter`, an optional filter object. See the next section for more information.
- `pagination: Pagination`, an optional pagination object. The pagination object is the defined in the common graphQL
  schema, included in the template microservice.

The result of such a query should be a payload object, which contains the following fields:

- `elements: [<nameOfTheObject>]!`: The items of the collection.
- `pagination: PaginationInfo!`: The pagination info object. The pagination info object is the defined in the common
  graphQL schema, included in the template microservice.

For example, a query type for the collection of courses looks like this:

```graphql
type Query {
    courses(
        sortBy: [String!]! = []
        sortDirection: [SortDirection!]! = [ASC]
        filter: CourseFilter
        pagination: Pagination
    ): CoursePayload!
}

type CoursePayload {
    elements: [Course!]!
    pagination: PaginationInfo!
}
```

### Filter

The filter object is a nested object, which contains the fields to filter by. The fields are defined in the filter
object of the object type. For example, the filter object for the course type looks like this:

```graphql
input CourseFilter {
    title: StringFilter
    description: StringFilter
    startDate: DateTimeFilter
    endDate: DateTimeFilter
    published: Boolean

    and: [CourseFilter!]
    or: [CourseFilter!]
    not: CourseFilter
}
```

The `StringFilter`, `DateTimeFilter`, and more filter objects are defined in the common graphQL schema, included in the
template microservice.
They allow field-level filtering, for example, filtering by a range of dates.
By providng the `and`, `or`, and `not` fields, filters can be combined allowing for more complex filtering.

For example, a query for filtering the currently active courses that are published, have a title or description
containing "math" looks like this:

```graphql
query {
    courses(
        filter: {
            published: true,
            startDate: {
                before: "2023-05-20T00:00:00.000Z"
            }
            endDate: {
                after: "2023-05-20T00:00:00.000Z"
            }
            and: {
              title: {
                  contains: "math"
              }
              or: {
                  description: {
                      contains: "math"
                  }
              }
            }
        }
    ) {
        elements {
            title
        }
    }
}
```

## Implementation

The implementation for sorting, filtering, and pagination is relatively simple.
We provide the `SortUtil` class in the common code, which can be used to convert the `sortBy` and `sortDirection`
arguments to a `Sort` object, which can be used in the repository.
For pagination, we provide the `PaginationUtil` class in the common code, which can be used to convert the `pagination`
argument to a `Pageable` object, which, again, can be used in the repository.

For filtering, it is a bit more complicated.
We provide the `SpecificationUtil` class in the common code, which can be used to convert the `filter` argument to
a `Specification` object, which is used for filtering in the repository. To be exact, it provides methods to convert
the `StringFilter`, `DateTimeFilter`, and to specifications, which
can be combined to create a specification for the whole filter object.

For example, for courses this looks like this:

```java
public class CourseFilterSpecification {

    public static Specification<CourseEntity> courseFilter(@NonNull CourseFilterDto filterDto) {
        return Specification.allOf(
                        stringFilter("title", filterDto.getTitle()),
                        stringFilter("description", filterDto.getDescription()),
                        dateTimeFilter("startDate", filterDto.getStartDate()),
                        dateTimeFilter("endDate", filterDto.getEndDate()),
                        booleanFilter("published", filterDto.getPublished()),
                        and(filterDto.getAnd(), CourseFilterSpecification::courseFilter),
                        not(filterDto.getNot(), CourseFilterSpecification::courseFilter))
                .or(
                        or(filterDto.getOr(), CourseFilterSpecification::courseFilter));
    }

}
```

The specification class should be in the `persistence.specification` package of the microservice.

The repositories of the microservice don't any new methods, but must extend the `JpaSpecificationExecutor` interface.

The whole implementation of the sorting, filtering, and pagination for the course microservice looks like this:

```java
public class CourseService {

    public CoursePayloadDto getCourses(CourseFilterDto filter,
                                       List<String> sortBy,
                                       List<SortDirectionDto> sortDirection,
                                       PaginationDto pagination) {
        Sort sort = SortUtil.createSort(sortBy, sortDirection);
        Pageable pageRequest = PaginationUtil.createPageable(pagination, sort);

        Specification<CourseEntity> specification = CourseFilterSpecification.courseFilter(filter);

        if (pageRequest.isPaged()) {
            Page<CourseEntity> result = courseRepository.findAll(specification, pageRequest);
            return createCoursePayloadDtoPaged(result);
        }

        // unpaged Pageable does not contain sorting information
        List<CourseEntity> result = courseRepository.findAll(specification, sort);
        return createCoursePayloadDtoUnpaged(result);
    }
}
```

The implementation for the other microservices is probably very similar.
