# Importing Quizzes Programmatically

Quizzes can be loaded into the system by using the GraphQL API.

A python script and example json is provided in the gits_backend repository at [/demo_scripts/import_quiz.py](https://github.com/IT-REX-Platform/gits_backend/blob/main/demo_scripts/import_quiz.py). The script is well-documented so it should be easy to understand and modify for more concrete needs if you know how GraphQL works.
API documentation for the system can be found [here](http://github.com/IT-Rex-Platform/graphql_gateway/api.md). This is especially relevant for the `addMultipleChoiceQuestion` and similar mutations, because in the API docs you can see what different fields and configurations can be set.