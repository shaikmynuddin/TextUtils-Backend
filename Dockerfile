FROM maven:3.2.1-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
COPY --from=build /target/fullstack-backend-0.0.1-SNAPSHOT.jar /fullstack-backend.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/fullstack-backend.jar"]