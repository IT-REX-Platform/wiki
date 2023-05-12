# Content service

Because the course service as planned originally contained too much business logic and the content dependency service was really small, the decision was made to change the responsabilities of both services.  
Everything content related in the course service (mainly references to content and the content order) is moved to the content dependency service.
Because the content dependency service now handles everything content related and not just the dependencies, it has been renamed to content service.