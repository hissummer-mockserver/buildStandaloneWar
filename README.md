# StandaloneJar
## Start application
* Download war
* Start spring-boot application
```
The wars was packaged by following the steps in https://github.com/hissummer-mockserver/mockserver. The every version of war are including mockserver(backend) and mockserverAdminUI projects.
```
Assume mongodb server is up and listen on the localhost:27017.  Please note , mongodb server version need greater than 3.2.0 or equal. Run below command:
```
$java -jar hissummer-mockserver.war  --server.port=8081 --spring.data.mongodb.host=localhost --spring.data.mongodb.port=27017
```
After started succesfully , access http://localhost:8081/

## Version
* <a href="https://github.com/hissummer-mockserver/StandaloneJar/raw/master/hissummer-mockserver-0.0.1-alpha.war"> 0.0.1-alpha </a> (may not work, please use 0.0.2-alpha)
* <a href="https://github.com/hissummer-mockserver/StandaloneJar/raw/master/mockserver-0.0.2-alpha.war"> 0.0.2-alpha </a>
