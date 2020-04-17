FROM nighteblis/oraclejdk:jdk8
WORKDIR /data
COPY ./hissummer-mockserver.war /data
COPY ./startmockserver.sh /data
RUN chmod u+x ./startmockserver.sh
ENV mongodbHost=172.16.1.250
ENV serverPort=8080
ENV mongodbPort=27017
CMD /data/startmockserver.sh ${serverPort} ${mongodbHost} ${mongodbPort}
