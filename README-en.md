# Build Standalone War
## This is the script to build adminui and mock server backend and generate the standalone war
You have to install build tools for vue and java project. 
```
git clone git@github.com:hissummer-mockserver/BuildStandaloneWar.git
cd BuildStandaloneWar
sh build.sh
```
## Build steps
```
If you want run one server integrated with mockServer and mockServer adminUi. You could not do step1 and step2, you need serve the Mockserver AdminUI in another webserver like nginx. 
```
1. Build admin ui first.  <a href="https://github.com/hissummer-mockserver/mockserverAdminUI" target="_blank">See how to build mockserver adminUi</a>
2. Copy the admin ui build files into the Mockserver source code.  
```
cp the dist/* to src/main/resource/static/
cp the dist/index.html to src/main/webapp/templates/
```
3. Build the mock server.
```
mvn clean package -Dmaven.test.skip=true
```
4. Install mongodb. 
```
Please install mongodb server, version need greater than  or equal 3.2. 
```
* <a href="https://docs.mongodb.com/manual/installation/">Mongodb install guide</a>  or <a href="https://hub.docker.com/_/mongo"> start docker </a>
5. Start mockserver.
Assumer mongodb server listen on the default localhost:27017 and just run the application.
```
java -jar target/hissummer-mockserver-0.0.1-SNAPSHOT.war  --server.port=8081 --spring.data.mongodb.host=localhost --spring.data.mongodb.port=27017
```
Why java -jar *.war (not *.jar) ,please read into this https://stackoverflow.com/questions/47258695/mvn-spring-bootrun-vs-java-jar

6. Browser access http://localhost:8081/ (will render /webapp/templates/index.html ) or  http://localhost:8081/index.html ( will access the /resource/static/index.html directly)
```
We could specify other port than 8081 when starting the application.
```
