# syntax=docker/dockerfile:1
FROM adoptopenjdk/openjdk8:x86_64-alpine-jdk8u292-b10
RUN apk add logrotate curl
WORKDIR /etc/logrotate.d/
COPY java java
WORKDIR /tmp
RUN wget https://raw.githubusercontent.com/joavila/java/master/tmp.I1JPAuziQF/HelloWorld.java
RUN javac -XDignore.symbol.file HelloWorld.java
COPY my_wrapper_script.sh my_wrapper_script.sh
COPY nc_reply.sh nc_reply.sh
CMD ./my_wrapper_script.sh
