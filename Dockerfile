# ---- Build Stage ----
FROM maven:3.8.6-eclipse-temurin-17 AS build

WORKDIR /app

COPY . .

RUN mvn clean package -DskipTests

# ---- Run Stage ----
FROM eclipse-temurin:17-jdk

WORKDIR /app

# Copy built JAR/WAR from build stage
COPY --from=build /app/target/*.jar app.jar

# Command to run the application (for a Spring Boot JAR)
CMD ["java", "-jar", "app.jar"]
