# hissummer-mockserver 构建脚本
用于构建“后台服务”和“前端管理页面”，并打包成一个war包文件。 war包文件可以单独或者部署在tomcat容器中使用。docker image的重新构建需要用到构建好的war包。

# 使用方法

## 构建war
build.sh [options]
|参数|描述|
|----|----|
|	 -h|帮助信息|
|	-v	 <versionName>| 构建的版本号

注意：
* 仅支持linux环境下运行该脚本
* 运行前需要安装git,yarn,node,mvn 工具

其他:
构建好的war包如何启动和搭建环境请访问 https://mockserver.hissummer.com。

## Docker-compose file

docker compose file 可以直接启动mongodb和mockserver

```
#cd compose
#sudo docker-compose up -d
```
启动成功后访问 http://localhost:8080/

compose 文件中的内容用于同时启动mongodb和hissummer-mockserver，快速的搭建mockserver服务环境。


## Docker file

docker文件中的内容用于构建docker image。如果你不需要修改和构建image，则可以直接使用docker镜像 nighteblis/hissummer-mockserver。 关于如何使用docker来启动hissummer-mockserver服务，请访问文档 https://mockserver.hissummer.com。

自己构建制作docker image：

* 第一步：拷贝war包到dockerfile目录
```
#cp  hissummer-mockserver.war dockerfile
```
* 第二步： 构建镜像
```
#cd dockerfile
#sudo docker  build -t <tag name>
```

# 链接

docker build: https://docs.docker.com/engine/reference/commandline/build/
docker compose: https://docs.docker.com/compose/


# 贡献
Horace Li


# 赞助

paypal account: https://www.paypal.me/nighteblis
