# ---------- Stage 1: build ----------
FROM eclipse-temurin:17-jdk AS build
WORKDIR /app
COPY gradlew settings.gradle build.gradle ./
COPY gradle ./gradle
RUN chmod +x gradlew && ./gradlew dependencies --no-daemon > /dev/null
COPY src ./src
RUN ./gradlew bootJar -x test --no-daemon

# ---------- Stage 2: runtime ----------
FROM eclipse-temurin:17-jre
LABEL maintainer="Nurbolat Djumadilov, IT2-2313"
WORKDIR /app
COPY --from=build /app/build/libs/nurbolat-djumadilov-student-api.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
