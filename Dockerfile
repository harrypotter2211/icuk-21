# ---- Build Stage ----
FROM maven:3.8.6-eclipse-temurin-17 AS build

WORKDIR /app

COPY . .

# Debug output before the actual command
RUN ls -la /app && cat pom.xml || true

# Run the Maven package step
RUN mvn clean package -DskipTests
