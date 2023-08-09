FROM alpine:latest
FROM eclipse-temurin:17
LABEL mentainer="javaguides.net@gmail.com"
WORKDIR /app
COPY --from=aquasec/trivy:latest /usr/local/bin/trivy /usr/local/bin/trivy
COPY /target/deccan-sport-club-1.1.jar /app/deccan-sport-club-1.1.jar
ENTRYPOINT ["java", "-jar", "deccan-sport-club-1.1.jar"]


# FROM eclipse-temurin:17

 

# LABEL mentainer="javaguides.net@gmail.com"

 

# WORKDIR /app

 

# COPY target/deccan-sport-club-1.1.jar /app/deccan-sport-club-1.1.jar

 

# ENTRYPOINT ["java", "-jar", "deccan-sport-club-1.1.jar"]
