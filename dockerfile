# Use Eclipse Temurin JDK 17 as base image
FROM eclipse-temurin:17-jdk

# Set working directory inside container
WORKDIR /app

# Copy the built JAR file into the container
COPY target/demo-app-1.0-SNAPSHOT.jar app.jar

# Command to run the JAR
CMD ["java", "-jar", "app.jar"]

