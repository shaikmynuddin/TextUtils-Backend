# Build stage
FROM maven:3.6.3-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Run stage
FROM openjdk:17.0.1-jdk-slim
WORKDIR /app
COPY --from=build /app/target/fullstack-backend-0.0.1-SNAPSHOT.jar /app/fullstack-backend.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/fullstack-backend.jar"]
