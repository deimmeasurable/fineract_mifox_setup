# Step 1: Build the App using Java 17
FROM eclipse-temurin:17-jdk-alpine AS build
WORKDIR /app
COPY . .
RUN ./gradlew build -x test

# Step 2: Run the App
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=build /app/fineract-provider/build/libs/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]