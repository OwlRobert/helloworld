# 1) Build stage: 直接在容器內完成 Maven 打包，避免缺少 target/*.jar
FROM maven:3.9.6-eclipse-temurin-8 AS build
WORKDIR /workspace
COPY pom.xml .
COPY src ./src
RUN mvn -B clean package -DskipTests

# 2) Runtime stage: 精簡 JRE 8 來執行打包好的 Spring Boot 應用
FROM eclipse-temurin:8-jre
WORKDIR /app
COPY --from=build /workspace/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]
