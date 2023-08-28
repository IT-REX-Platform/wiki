# Scalability Testing

## Prerequisites
 - a working version of k6: https://k6.io/docs/get-started/installation/

## Test setup
 - The tests use a number of environment variables, to simplify the execution of the tests two scripts are provided.
   - run_test.bat which is preconfigured for the local docker environment. It assumes that the gateway runs on port 8080 
     and a user with the name and password "test" is registered in keycloak. 
   - deployed_test.bat which is preconfigured for the deployed environment. It runs against https://orange.informatik.uni-stuttgart.de/graphql
     and also is preconfigured for a user with the name and password "test". To properly function this script also requires a VPN connection.
 - To change any of the environment variables just change the respective variable in one of the scripts.
 -  The following variables are defined: 
<table>
<thead>
<tr>
<th>Name</th>
<th>Function</th>
</tr>
</thead>
<tbody>
<tr>
<td>K6_HOST</td>
<td>URL to the Keycloak. Used to fetch a token.</td>
</tr>
<tr>
<td>K6_REALM</td>
<td>Name of the Realm in Keycloak. Used to fetch a token.</td>
</tr>
<tr>
<td>K6_CLIENT_ID</td>
<td>Client ID of the Application. Used to fetch a token.</td>
</tr>
<tr>
<td>K6_USERNAME</td>
<td>Username of a valid user. Used to fetch a token.</td>
</tr>
<tr>
<td>K6_PASSWORD</td>
<td>Password of the user. Used to fetch a token.</td>
</tr>
<tr>
<td>K6_GATEWAY_URL</td>
<td>URL to the Graphql Api/Gateway. Used to make queries.</td>
</tr>
</tbody>
</table>

 - The token.js script is used to acquire an authentication token, and needs to be imported into any script.
 - To execute a test just run the run_test.bat or deployed_test.bat via a shell and add the name of the script as an argument
   e.g. ```.\run_test.bat getmedia.js```
 - To write the test results to a file use ```--out csv=<filename>.csv``` more info: https://k6.io/docs/results-output/real-time/

## Writing and running tests
K6 uses test script written in javascript. The most important part are the `options`. They define how a test run should look like.
More info: https://k6.io/docs/using-k6/k6-options/
The getmedia.js has a variety of test scenarios already. All other tests currently only have one scenario. https://k6.io/docs/using-k6/scenarios/
 - The **five_hundred_users** scenario tries to make 500 requests as fast as possible.
 - The **ramping_users** scenario increases the number of virtual users over a period of 3 minutes. The test will make as many requests as possible.
 - the **constant_arrival_rate** scenario makes a constant number of requests per second over a period of 1 minute.
 - The **ramping_arrival_rate** scenario increases the number of requests per second every 30 seconds up to 500 requests per second.

The `const query` defines the query which should be used. Mutations are also possible. See `createCourse.js`.
The `function setup` sets up the tests by running the getToken function from the token.js script.
The `default function` runs the actual request. 
`const headers` is used define the authorization header. `const res` is the actual request. Those two shouldn't require any modifications.

Once the tests have run they will print a number of metrics to the console: https://k6.io/docs/using-k6/metrics/

