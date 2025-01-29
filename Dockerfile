#multi-stage to access java-application
# FROM maven AS build
# WORKDIR /app
# RUN git clone https://github.com/SandhyaReddy-2713/java-application.git /app
# RUN mvn clean install

# FROM openjdk:17-alpine
# WORKDIR /test
# COPY --from=build /app/target/*.war /test
# CMD ["java", "-jar", "app-0.0.1-SNAPSHOT.war"]
# EXPOSE 8080


#to access application on tomcat server integrated with jenkins.
FROM maven as build
WORKDIR /app
COPY . /app
RUN mvn clean install -DskipTests

FROM tomcat
RUN sed -i 's/port="8080"/port="8081"/g' /usr/local/tomcat/conf/server.xml 
COPY --from=build /app/target/app-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8081
CMD ["catalina.sh", "run"]
