# First stage - Build
#choosing the base image as maven:
FROM maven:3.8.7-openjdk-18-slim as build

#setting up the workdirectory:
WORKDIR /app

#copying the application code:
COPY . .

#compiling the maven packages:
RUN mvn clean package

# Second stage - Runtime
#choosing the java image for application deployment:
FROM openjdk:17-slim

#setting up work directory:
WORKDIR /app-runtime

#copying the complied jar file from 1st stage:
COPY --from=build /app/target/spring-boot-docker.jar .

#exposing the application:
EXPOSE 8080

#container starting command:
CMD ["java", "-jar", "spring-boot-docker.jar"]
