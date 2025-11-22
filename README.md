# Jenkins Automated Maven + Docker Pipeline Project

## 📖 Project Overview
This project demonstrates a fully automated CI/CD pipeline using **Jenkins**, **Maven**, **Git**, and **Docker**.

The pipeline performs the following steps:
- ✅ Checks out code from GitHub  
- ✅ Builds a Java Maven project  
- ✅ Runs tests  
- ✅ Packages the project into a JAR  
- ✅ Builds a Docker image containing the JAR  
- ✅ Runs the Docker container  
- ✅ Shows logs and application output  

> Built on a local Ubuntu machine for learning and demonstration purposes.

---

## 🔧 Prerequisites
Before running the project, ensure the following are installed:

- Ubuntu (or any Linux-based OS)
- Java 17
- Git
- Maven
- Docker
- Jenkins

Also, grant Jenkins access to Docker:
```bash
sudo usermod -aG docker jenkins
sudo systemctl restart jenkins

📂 Project Structure

demo-app/
├── src/
│   ├── main/java/com/example/App.java
│   └── test/java/com/example/AppTest.java
├── Dockerfile
├── pom.xml
└── Jenkinsfile
- pom.xml → Maven project configuration
- Dockerfile → Builds a Docker image with the compiled JAR
- Jenkinsfile → Pipeline definition for Jenkins
- src/ → Java source and test files
🚀 Step-by-Step Workflow
Phase 1: Setup Local Environment
- Install required tools: Ubuntu, Java 17, Git, Maven, Jenkins
- Start Jenkins and access dashboard: http://localhost:8080
- Install recommended Jenkins plugins
Phase 2: Maven Project Setup
- Create a sample Maven Java project
- Edit pom.xml to set Java version 17
- Fix compilation errors
- Build project locally:
mvn clean package


Phase 3: GitHub Integration
git init
git add .
git commit -m "Initial commit"
git remote add origin git@github.com:your-username/demo-app.git
git push -u origin master


Phase 4: Jenkins Job Setup
- Create a Pipeline Job in Jenkins
- Configure GitHub repository SSH URL
- Verify Jenkins can access GitHub with SSH
Phase 5: Docker Integration
Dockerfile:
FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY target/demo-app-1.0-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]


Build and run:
docker build -t demo-app .
docker run -d -p 9090:8080 --name demo-app-container demo-app


Note: Port 8080 was already used by Jenkins, so we mapped to 9090.

Phase 6: Jenkins Pipeline
The Jenkinsfile automates:
- Checkout code from GitHub
- Build Maven project
- Run tests
- Build Docker image
- Run Docker container
- Display logs
Sample stage view:
Checkout → Maven Build → Docker Build → Run Container → Check Logs
- 🟦 Blue stages: success
- 🟥 Red stages: failed
Phase 7: Testing & Verification
- Access application: http://localhost:9090
- Confirm output: Hello World!
- Check container logs:
docker logs demo-app-container



⚠️ Important Notes
- Ensure Jenkins has Docker permissions:
sudo usermod -aG docker jenkins
sudo systemctl restart jenkins
- If port 8080 is used by Jenkins, map container to a different port.
- Always commit Dockerfile and Jenkinsfile to GitHub.

🧹 Cleanup Commands
docker rm -f demo-app-container
docker rmi -f demo-app
docker system prune -f



✅ Conclusion
This project demonstrates a real CI/CD workflow:
Code → Build → Test → Dockerize → Deploy
- Fully automated using Jenkins pipeline
- Easy to extend for more complex applications





