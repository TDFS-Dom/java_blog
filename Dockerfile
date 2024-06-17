FROM --platform=linux/amd64 eclipse-temurin:8-jre-focal
ENV TZ=Asia/Ho_Chi_Minh
ENV APP_NAME=garage-service
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
WORKDIR /app
ADD target/springboot-blog.jar /app/

CMD ["java", "-jar", "springboot-blog.jar"]