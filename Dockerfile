FROM maven:3.8.4-openjdk-11 AS build
COPY . .
RUN mvn clean package -DskipTests
FROM openjdk:11.0.11-jdk-slim
COPY --from=build target/IndivivualP-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]
