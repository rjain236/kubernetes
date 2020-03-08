FROM openjdk:8-jdk-alpine
VOLUME /tmp
ADD target/webserver.jar hello-docker-app.jar
ENV JAVA_OPTS=""
EXPOSE 8083
CMD [ "sh", "-c", "java $JAVA_OPTS -jar /hello-docker-app.jar" ]