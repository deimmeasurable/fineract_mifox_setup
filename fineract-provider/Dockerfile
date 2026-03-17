# Step 1: Use Java 17 to build the project
FROM eclipse-temurin:17-jdk-alpine AS build
WORKDIR /app

# Copy all files from your repo into the container
COPY . .

# Build the Fineract JAR file, skipping tests
RUN ./gradlew clean bootJar -x test

# Step 2: Create the final lightweight image
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# Copy the generated JAR from the build stage
# Note: The path might vary slightly depending on your Fineract version
COPY --from=build /app/fineract-provider/build/libs/fineract-provider.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]