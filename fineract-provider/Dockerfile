# Stage 1: Build the Java application
FROM eclipse-temurin:17-jdk-alpine AS build
WORKDIR /app

# Copy the Gradle wrapper and configuration files first
COPY gradlew .
COPY gradle gradle
COPY build.gradle .
COPY settings.gradle .

# Copy the rest of the source code
COPY . .

# Grant execution permissions and build the JAR
RUN chmod +x ./gradlew
RUN ./gradlew clean bootJar -x test

# Stage 2: Create the runtime image
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# Copy the built JAR from the first stage
# Note: This path assumes the standard Fineract structure
COPY --from=build /app/fineract-provider/build/libs/fineract-provider.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]