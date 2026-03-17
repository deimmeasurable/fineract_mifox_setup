# Stage 1: Build using Java 17
FROM eclipse-temurin:17-jdk-alpine AS build
WORKDIR /app

# Copy the wrapper and settings first (helps with caching)
COPY gradlew .
COPY gradle gradle
COPY fineract-provider/build.gradle .
COPY settings.gradle .
COPY fineract-provider .

# Use Java 17
FROM eclipse-temurin:17-jdk

# Set working directory
WORKDIR /app

# Copy project files
COPY fineract-provider .

# Build the app
RUN chmod +x ./gradlew && ./gradlew clean bootJar -x test

# Expose port
EXPOSE 8080

CMD ["sh", "-c", "java -Xms256m -Xmx512m -Dserver.port=$PORT -Dspring.profiles.active=postgresql -jar build/libs/fineract-provider-*.jar"]