FROM maven:3.8.2-jdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests
FROM openjdk:17
EXPOSE 8080
COPY --from=build /target/docker-spring-boot.jar docker-spring-boot.jar
ENTRYPOINT ["java","-jar", "docker-spring-boot.jar"]
