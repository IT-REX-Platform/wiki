# Handling invalid ids in frontend

Many pages contain one or more parameters in their URL.
As these can be entered by the user, they should be validated.
For a course page this is done by trying to fetch course details from the backend.
When a parameter is invalid, i.e., no course with such ID was found, an error page should be displayed.

There are a two ways to accomplish this:

- Fetch the information in `getStaticProps`
- Fetch on the client and display an error dynamically

The first option has the benefit that the error page is displayed automatically when the `getStaticProps` returns an error, no custom logic is required.
As these pages are different for every user, this option is not ideal. The next.js documentation recommends using this if it could be cached.

The second option simply displays something else when an error is detected.
Next.js provides a prebuilt `Error` component for this (`import NextError from 'next/error'`), which can be used for this.

## Solving useState issues

React displays a warning if the order or number of `useState` invocations is not the same for each call of the component function.
This can be the case if the initial value depends on the result of an API request.

```jsx
import NextError from 'next/error';

function MyPage() {
    const result = apiRequest();
    if (result == null) {
        return <NextError statusCode={404} />
    }

    const [message, setMessage] = useState(result.message);
    return (
        <div>{message}</div>
    )
}
``` 

Moving the `useState` to the top is not always possible without some workaround.
The easiest solution is to refactor the second half into a separate component.

```jsx
import NextError from 'next/error';

function MyPage() {
    const result = apiRequest();
    if (result == null) {
        return <NextError statusCode={404} />
    }
    return <Message message={result} />
}

function Message({ result }) {
    const [message, setMessage] = useState(result.message);
    return (
        <div>{message}</div>
    )
}
```
