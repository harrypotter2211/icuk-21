# Build stage with JDK 8
FROM maven:3.8.6-eclipse-temurin-8 AS build

WORKDIR /app

COPY . .

RUN mvn clean package -DskipTests

# Run stage with JDK 8
FROM eclipse-temurin:8-jdk

WORKDIR /app

# Copy WAR from build stage
COPY --from=build /app/target/*.war ./app.war

# Use Jetty or Tomcat to run the WAR
# For example, use Jetty base image if you want to run WAR directly
# Alternatively, run your WAR in an app server you install/configure here

CMD ["java", "-jar", "app.war"]  # Replace with your server startup command
