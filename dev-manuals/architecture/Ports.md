# Ports
The Ports for the microservices get assigned after the following schema:

xx00 -> dapr port
xx01 -> server port
xx32 -> database port

Some services might use additonal ports, like the mediaservice.

## Currently used Ports

<table>
<thead>
<tr>
<th>Service</th>
<th>Port</th>
<th>dapr</th>
<th>app-id </th>
</tr>
</thead>
<tbody>
<tr>
<td>Gateway</td>
<td>1000</td>
<td>yes</td>
<td>api-gateway-service</td>
</tr>
<tr>
<td>Gateway</td>
<td>1001</td>
<td>no</td>
<td></td>
</tr>
<tr>
<td>Course Service  </td>
<td>2000</td>
<td>yes</td>
<td>course_service</td>
</tr>
<tr>
<td>Course Service </td>
<td>2001</td>
<td>no</td>
<td></td>
</tr>
<tr>
<td>Course Service DB </td>
<td>2032</td>
<td>no</td>
<td></td>
</tr>
<tr>
<td>Media Service</td>
<td>3000</td>
<td>yes</td>
<td>media_service</td>
</tr>
<tr>
<td>Media service</td>
<td>3001</td>
<td>no</td>
<td></td>
</tr>
<tr>
<td>Media Service DB</td>
<td>3032</td>
<td>no</td>
<td></td>
</tr>
<tr>
<td>MinIO</td>
<td>9000</td>
<td>no</td>
<td></td>
</tr>
<tr>
<td>MinIO console </td>
<td>9090</td>
<td>no</td>
<td></td>
</tr>
<tr>
<td>Content Service</td>
<td>4000</td>
<td>yes</td>
<td>content_service</td>
</tr>
<tr>
<td>Content Service</td>
<td>4001</td>
<td>no</td>
<td></td>
</tr>
<tr>
<td>Content Service DB</td>
<td>4032</td>
<td>no</td>
<td></td>
</tr>
<tr>
<td>User Service </td>
<td>5000</td>
<td>yes</td>
<td>content_service</td>
</tr>
<tr>
<td>User Service </td>
<td>5001</td>
<td>no</td>
<td></td>
</tr>
<tr>
<td>User Service DB </td>
<td>5032</td>
<td>no</td>
<td></td>
<td></td>
</tr>
</tbody>
</table>