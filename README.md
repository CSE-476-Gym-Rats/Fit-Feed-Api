# Fit-Feed-Api
A REST API backend for FitFeed based on Spring framework.

## Setup instructions
To build and run the server locally, follow these steps:

### Prereqs:
- Docker Desktop
- IntelliJ Idea (preferred IDE) OR Terminal

### Setup:
1. Install Docker
2. Run the Docker containers.

You can either do this via IntelliJ run configurations or terminal.

#### IntelliJ
Simply run the configuration called `Docker Compose` (or `Docker Compose (dev)` if experiencing connectivity issues).

#### Terminal
In the project root directory, run the following command:
```shell
docker compose up -d
```
This command will initialize the Keycloak and MySQL containers locally.

Note: if running on a Mac or experiencing connectivity issues to the containers,
you can use the alternative docker compose configuration using the following command:
```shell
docker compose -f compose-dev.yaml up -d
```

3. Run the Server.

Again, you can do this via IntelliJ run configuration or terminal.

#### IntelliJ
Simply run the configuration called `StartServer`, which will handle building and running the server.

#### Terminal
In the project root directory, run the following commands:

##### Windows
```shell
.\gradlew.bat build
java -jar ./build/libs/api-0.0.1-SNAPSHOT.jar
```

##### OSX/Linux
```shell
./gradlew build
java -jar ./build/libs/api-0.0.1-SNAPSHOT.jar
```

4. The server is now running!

You can use the Postman collections to test the endpoints locally :)
