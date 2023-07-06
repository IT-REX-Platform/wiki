# Handling form errors

## Highlight invalid fields

It is important for the user to know which fields are invalid.
Most MUI input fields have a `required` prop to display a asterix (*) next to the title to signalize that filling it out is requried.
They also have a `error` prop which toggles the error state of the input component (red outline, etc), which should be used.

Date Pickers do not have these props as they are wrappers around other input components.
It is however possible to pass these to the actual input component via `slotProps`.

```jsx
<DatePicker
  // ... other props
  slotProps={{
    textField: {
      required: true,
      error: endDate == null || !endDate.isValid(),
    },
  }}
/>
```

## Display API errors

Regardless of validating the input in the frontend, a backend error can still occurr.
The `Alert` component can be used for this.

```jsx
function MyPage() {
  const [error, setError] = useState(null)
  return (
    <div>
      {error && (
        <Alert severity="error" onClose={() => setError(null)}>
          {err.message}
        </Alert>
      )}
    </div>
  )
}
```

## GraphQL errors

**NOTE: Tested only with mockserver, may differ with real backend**

GraphQL errors can be obtained through the `onError` callback when submitting mutations, etc.
The error obtained through this is typed to implement the `Error` interface.
This gives access to `.name` and `.message`.
The object however has more detailed error information than this.

```jsx
function MyPage() {
  const [updateCourse, isUpdating] = useMutation(/* ... */);

  function handleSubmit() {
    updateCourse({
      variables: { /* ... */ },
      onError(error) {
        setError(error);
      },
    });
  }

  return (
    <div>
      {error?.source.errors.map((err: any) => (
        <Alert severity="error" onClose={() => setError(null)}>
          {err.message}
        </Alert>
      ))}

      ...
    </div>
  );
}
```
