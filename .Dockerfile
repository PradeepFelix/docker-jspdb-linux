# we are extending everything from tomcat:8.0 image ...
FROM tomcat:8.5

#add tomcat users
ADD /build/tomcat-users.xml /usr/local/tomcat/conf/
ADD /build/context.xml /usr/local/tomcat/webapps/manager/META-INF/

#allow forward slash to launch the app
COPY /build/server.xml /usr/local/tomcat/conf/

#deploying the spring application into tomcat
ADD /build/DbTest.war /usr/local/tomcat/webapps/DbTest.war

#Add the web.xml file to render tomcat root as the application
#ADD /build/web.xml /usr/local/tomcat/webapps/DbTest/WEB-INF/

#starting up and running the tomcat service
WORKDIR /usr/local/tomcat/bin
CMD ["./catalina.sh", "run"]
