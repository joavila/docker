<h1> Tests <a href="https://github.com/joavila/java/tree/master/tmp.I1JPAuziQF">networkaddress.cache.ttl</a> within a container</h1>
<p> Creates container based on <i>adoptopenjdk/openjdk8:x86_64-alpine-jdk8u292-b10</i></p>
<ul>
<li>
<p>Build container</p>

```bash
docker build --no-cache  -t uhe .
```

</li>
<li>
<p>Run container</p>

```bash
docker run -it --name test uhe:latest
```

</li>
<li>
<table>
<tr>
<th>
Environemental variable
</th>
<th>
Usage
</th>
</tr>
<tr>
<td>
DESTINATION_FQDN
</td>
<td>Defines destination FQDN. <i>www.nowayjose1.com</i> otherwise.
</tr>
<tr>
<td>
DESTINATION_PORT
</td>
<td>Defines destination PORT. <i>80</i> otherwise.
</tr>
<tr>
<td>
TTL
</td>
<td>Defines <i>networkaddress.cache.ttl</i>. <i>120</i> otherwise.
</tr><tr>
<td>
BUCKET
</td>
<td>Uses bucket PAR to store rotated logs. Filesystem otherwise.
</tr>
</table>
</li>
</ul>

