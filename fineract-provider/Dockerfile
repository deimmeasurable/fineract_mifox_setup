# Use Java 17 for the build
FROM eclipse-temurin:17-jdk-alpine AS build
WORKDIR /app

# Copy everything
COPY . .

# Build the app
RUN ./gradlew clean bootJar -x test

# Run the app
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
# Note: Ensure this path matches your project structure
COPY --from=build /app/fineract-provider/build/libs/fineract-provider.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]