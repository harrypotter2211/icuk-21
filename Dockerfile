FROM maven:3.8.6-jdk-8

WORKDIR /app
COPY . /app

RUN mvn clean package

CMD ["java", "-jar", "target/maven-web-application.war"]
