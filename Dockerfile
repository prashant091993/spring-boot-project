FROM fabric8/java-alpine-openjdk8-jre
ADD ["target/spring-boot-pwa-0.1.jar", "app.jar"]
EXPOSE 8304 
ENV JAVA_OPTS="-Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=8787,suspend=n  -Dspring.profiles.active=prod"
RUN sh -c 'touch /app.jar'
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]


#From tomcat:8-jre8 
#COPY ./target/spring-boot-pwa-0.1.jar /usr/app/
#WORKDIR /usr/app/
#EXPOSE 8086
#ENTRYPOINT ["java", "-jar", "spring-boot-pwa-0.1.jar"]