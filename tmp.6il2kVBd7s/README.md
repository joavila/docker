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
<li>The following, along with the ones inherited from <a href="https://github.com/joavila/java/tree/master/tmp.I1JPAuziQF">here</a>
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
BUCKET
</td>
<td>Uses bucket PAR to store rotated logs. Filesystem otherwise.
</tr>
</table>
</li>
</ul>

