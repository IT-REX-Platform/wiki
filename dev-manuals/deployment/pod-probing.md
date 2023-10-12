# Pod Probing
To ensure our deployed services are running properly Kubernetes allows for [probing](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/) of our deployed services in [pods](https://kubernetes.io/docs/concepts/workloads/pods/).
In our deployment, we make use of the liveness and the readiness probes. 

## Enabling Probing for a service
To enable probing for a service, changes to the deployment file of the service in [gits-infra](https://github.com/IT-REX-Platform/gits-infra) and the application settings (if the service is a spring boot application) need to be performed.

### Enabling Probing in Spring Boot applications
Spring offers a technology-agnostic library ([Spring Actuator](https://www.baeldung.com/spring-boot-actuators)) to expose operational information of a running application, such as health, info, and metrics.  These can be exposed via HTTP endpoints or JMX beans. To add this library to a spring service following dependency needs to be added to the 'build.gradle' file.
```
dependencies {
...
implementation 'org.springframework.boot:spring-boot-starter-actuator'
}
```
By default spring offers the following HTTP endpoints:

```
http://localhost:PORTNUMBER/actuator
```

```
http://localhost:PORTNUMBER/actuator/health
```

```
http://localhost:PORTNUMBER/actuator/info
```
Calling either of those endpoints will return all enabled information under those endpoints. Under the first URL, all available underlying endpoints & URLs can be retrieved.
By default, spring disables most information endpoints. This includes the endpoints for liveness and readiness. 
To enable these endpoints following lines need to be added to the 'application.properties' file:
```
management.endpoint.health.probes.enabled=true
management.health.livenessstate.enabled=true
management.health.readinessState.enabled=true
```
To locally test if these states can be accessed, deploy the application in a docker container. Then send an HTTP request to the following URLs: 
```
http://localhost:PORTNUMBER/actuator/health/liveness
```
for liveness
```
http://localhost:PORTNUMBER/actuator/health/readiness
```
for readiness

If things are set up correctly the HTTP response code should be a '204' and return a JSON in the response body.
For more information, we recommend reading the [official spring documentation](https://docs.spring.io/spring-boot/docs/2.3.0.RELEASE/reference/html/production-ready-features.html#production-ready-health).

### Configure Probing in the deployment file
To manage all our configurations for the deployment of all our services we [terraform](https://www.terraform.io/).
Therefore all of our files in our [deployment repository](https://github.com/IT-REX-Platform/gits-infra) are terraform files.
To allow probing for a service the 'container' spec needs to be extended by the following example code block: 
```
liveness_probe {
    http_get {
        path = "/actuator/health/liveness"
        port = 2001       
        }     

    initial_delay_seconds = 30         
    period_seconds        = 9         
}                           

readiness_probe {           
    http_get {         
        path = "/actuator/health/readiness"       
        port = 2001       
    }         

    initial_delay_seconds = 30         
    period_seconds        = 9         
}           
```
Note the port number has to match that of the app port number (see 'server.port' in 'application.properties')

## Probing for Dapr Sidecar
With each service, we also inject/deploy a DAPR sidecar to handle incoming and outgoing DAPR messages.
These already contain [pre-defined probing endpoints](https://v1-5.docs.dapr.io/developing-applications/building-blocks/observability/sidecar-health/):
```
livenessProbe:
      httpGet:
        path: v1.0/healthz
        port: 3500
      initialDelaySeconds: 5
      periodSeconds: 10
      timeoutSeconds : 5
      failureThreshold : 3
readinessProbe:
      httpGet:
        path: v1.0/healthz
        port: 3500
      initialDelaySeconds: 5
      periodSeconds: 10
      timeoutSeconds : 5
      failureThreshold: 3
```
More information on the responses and their meaning can be found [here](https://docs.dapr.io/reference/api/health_api/).