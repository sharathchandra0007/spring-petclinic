FROM maven:3.9.7-eclipse-temurin-17 AS build
RUN git clone https://github.com/longflewtinku/spring-petclinic.git && \
    cd spring-petclinic && \
    mvn package
# jar location /spring-petclinic/target/spring-petclinic-3.4.0-SNAPSHOT.jar
FROM amazoncorretto:17
LABEL project="spring-petclinic"
LABEL author="develop-branch"
EXPOSE 8080
COPY --from=build /spring-petclinic/target/spring-petclinic-3.4.0-SNAPSHOT.jar /spring-petclinic-3.4.0-SNAPSHOT.jar
CMD ["java", "-jar", "/spring-petclinic-3.4.0-SNAPSHOT.jar"]