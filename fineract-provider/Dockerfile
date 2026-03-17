# Stage 1: Build using Java 17
FROM eclipse-temurin:17-jdk-alpine AS build
WORKDIR /app

# Copy the wrapper and settings first (helps with caching)
COPY gradlew .
COPY gradle gradle
COPY build.gradle .
COPY settings.gradle .
COPY . .

# Build the JAR, skipping tests to save time and memory
RUN chmod +x ./gradlew
RUN ./gradlew clean bootJar -x test

# Stage 2: Runtime image
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# Note: Ensure this path matches where Gradle outputs your JAR
COPY --from=build /app/fineract-provider/build/libs/fineract-provider.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]