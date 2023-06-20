# syntax=docker/dockerfile:1
FROM adoptopenjdk/openjdk8:x86_64-ubi-minimal-jdk8u292-b10-slim
RUN microdnf update && microdnf install logrotate curl nc cronie
WORKDIR /etc/logrotate.d/
COPY java java
WORKDIR /tmp
RUN curl -s -O -J https://raw.githubusercontent.com/joavila/java/master/tmp.I1JPAuziQF/HelloWorld.java
RUN javac -XDignore.symbol.file HelloWorld.java
COPY my_wrapper_script.sh my_wrapper_script.sh
COPY nc_reply.sh nc_reply.sh
CMD ./my_wrapper_script.sh
