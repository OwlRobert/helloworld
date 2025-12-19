# 使用穩定的 Java 8 Runtime
FROM eclipse-temurin:8-jre

# 設定容器內工作目錄
WORKDIR /app

# 將 Spring Boot 打包好的 jar 複製進來
# 這裡用萬用字元，避免每次改版本號
COPY target/*.jar app.jar

# Spring Boot 預設 port
EXPOSE 8080

# 啟動 Spring Boot
ENTRYPOINT ["java","-jar","/app/app.jar"]
