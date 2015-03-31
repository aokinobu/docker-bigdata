#!/bin/bash
#cp /bigdata/ant-build/bigdata.war /var/lib/jetty/webapps
if [ ! -f /usr/local/tomcat/webapps/bigdata.war ];
then
	cp /bigdata/ant-build/bigdata.war /usr/local/tomcat/webapps
fi
export JAVA_OPTS="-server -Xmx16g -Dcom.bigdata.rdf.sail.webapp.ConfigParams.propertyFile=/usr/local/tomcat/webapps/bigdata/WEB-INF/RWStore.properties"
catalina.sh run
