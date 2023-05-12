# Automatically generate graphQL API docs

We use (https://github.com/exogen/graphql-markdown) to generate API docs.
The installation is described there.
While the server is running, you can run the command
```
graphql-markdown http://localhost:{port}/graphql > {outputfile}
```

The generated file then should be moved in this wiki in this folder.
