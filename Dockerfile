FROM azul/zulu-openjdk:17-latest
LABEL authors="alexholt"

COPY ./build/libs/api-0.0.1-SNAPSHOT.jar /home/dev/

CMD ["java", "-jar", "/home/dev/api-0.0.1-SNAPSHOT.jar"]