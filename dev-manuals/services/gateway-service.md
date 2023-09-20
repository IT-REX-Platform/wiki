# Gateway

The gateway provides a unified API to access the functionality of the GITS backend.

The gateway is run as a [GraphQL Mesh](https://the-guild.dev/graphql/mesh) server which merges the GraphQL schemas of the different microservices into one unified schema.

More information on the basic idea of our setup using GraphQL Mesh can be found [here](../architecture/graphql.md).

## Usage
### Docker Environment
As the gateway is useless without any other services, it is recommended you run it via the [gits_backend repository](https://github.com/IT-REX-Platform/gits_backend).

### Running the Gateway Standalone
A `docker-compose` file is provided which can be used to run the gateway via a terminal using `docker compose up`.

The gateway expects environment variables to be set which provide relevant configuration information for the gateway to run. The basic `docker-compose` file is set up to set these env variables for a configuration in which the other microservices are running on their default ports inside of the local docker network.

If the gateway is to be run without the `docker-compose` file, these environment variables have to be set by other means.

### Changing Configuration

Changing the hostname and port of the gateway can be achieved by modifying the relevant environment variables, located inside the `docker-compose` file.

If ports of the other microservices are changed or microservices are being run on another address, the environment variables for the different microservices, located inside the `environment` section of the `docker-compose` file, need to be changed.

## Adding More Microservices to the Gateway

Please take a look at the [GraphQL Mesh Documentation](https://the-guild.dev/graphql/mesh/docs/getting-started/your-first-mesh-gateway).

Sources (i.e. our different microservices) are defined at the top of the `.meshrc.yaml` file, inside the `sources` section.

The gateway stitches together the schemas provided by the sources provided.

The `additionalTypeDefs` section defines modifications to the stiched-together GraphQL schema. Here, fields are added and relevant information is provided which the gateway uses to populate the fields with data.

For example, a `contents` field is added to the Chapter type. This field's data is retrieved by sending a `contentsByChapterIds` Query to the `ContentService` source, where the query's `chapterIds` parameter is filled with the value of the `id`-field of the current `Chapter` object. 

The `additionalResolvers` section defines code for custom GraphQL queries which are implemented in TypeScript files in the corresponding folder.
