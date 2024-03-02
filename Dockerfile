# Start with a base image containing Java runtime
FROM openjdk:17-jdk-alpine
#FROM adoptopenjdk:17-jdk-hotspot

# Add Maintainer Info
LABEL maintainer="example@example.com"

# Set the current working directory in the image
WORKDIR /app

# Copy the jar to the container
COPY ./target/gen-0.0.1-SNAPSHOT.jar /app

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Run the jar file 
ENTRYPOINT ["java","-jar","/app/gen-app.jar"]


