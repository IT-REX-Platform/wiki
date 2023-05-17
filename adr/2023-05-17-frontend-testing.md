# Frontend testing

Several testing techniques were considered:

- unit testing
- visual testing (component and integration)
- integration testing
- manual testing

Under unit tests we understood tests that check functionality of individual components by inspecting mainly its HTML result.
As these test are tightly coupled to the code and have to be changed often we decided against them for the bulk of our testing.
They also do not catch errors in styling well.

The idea of visual regression testing seemed appealing to us, which compares the rendered component/page to a reference image.
UI changes can be detected easily, they are not tightly coupled to the code, and also easy to implement.

Automated integration testing opens the page in a browser and executes predefined interactions.
Checks are normally HTML based, but can also be done visually using screenshots.

As no (open-source) testing framework could really satisfy all of our requirements, we decided to mainly do manual testing with defined test cases.
We may also implement some automated integration tests were benefitial and easy implement.

## Testing Frameworks

As we mainly wanted to do visual regression tests for components and within integration test, our search was also mostly in that direction.
Requirements were that it works with React/NextJs and Typescript.
Paid solutions were also not considered.

### Jest with React Testing Framework

Mainly for unit tests.
Setup with NextJs and Typescript proved difficult, but should be possible.
As it has a virtual DOM, visual regression tests are difficult.

### Cypress

Cypress executes tests inside an actual browser, which can be a benefit or a downside.
Recently, it also gained support for component testing.
Visual tests can be done easily and the result can be viewed in a nice web interface, but also headless for a CI.
One major limitation for visual tests is, that pseudo-classes like ":hover" cannot be tested.

### Playwright

For integration tests within a browser, component tests is experimental.
Component test were evaluated, but were buggy.
For instance, the same test/component in different files yielded different results.
