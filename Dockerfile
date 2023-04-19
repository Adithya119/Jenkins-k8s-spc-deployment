FROM openjdk:17
#saving the jar file in root folder with name "spring-petclinic.jar" because by default any cont is run by root.
COPY spring-petclinic-3.0.0-SNAPSHOT.jar /spring-petclinic.jar
EXPOSE 8080
CMD ["java", "-jar", "/spring-petclinic.jar"]