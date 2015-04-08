install:
	mkdir /opt/bigdata
	cp -R db /opt/bigdata

build:
	sudo docker build -t aoki/bigdata .

run:
	sudo docker run -d --restart="always" -v /tmp/bigdata:/tmp -v /opt/bigdata/webapps:/usr/local/tomcat/webapps -v /opt/bigdata:/opt/bigdata -t -p 8081:8080 --name="bigdata_bluetree" aoki/bigdata
#/usr/local/bigdata-opensource/bin/bigdata-t -df +configfile /bigdata-opensource/db/bigdata.ini

bash:
	sudo docker run -it --rm -v /tmp/bigdata:/tmp -v /opt/bigdata/webapps:/usr/local/tomcat/webapps -v /opt/bigdata:/opt/bigdata aoki/bigdata /bin/bash

env:
	sudo docker run -it -v /opt/bigdata:/bigdata --rm --link mysql-bigdata_bluetree:db aoki/bigdata env

ps:
	sudo docker ps

stop:
	sudo docker stop bigdata_bluetree

rm:
	sudo docker rm bigdata_bluetree

ip:
	sudo docker inspect -f "{{ .NetworkSettings.IPAddress }}" bigdata_bluetree

restart:
	sudo docker restart bigdata_bluetree

dump:
	sudo docker export bigdata_bluetree > mail.gly.tar

load:
	cat mail.gly.tar.gz | docker import - aoki/mail:mail_bluetree
	
clean: stop rm build run
	echo "cleaned."

logs:
	sudo docker logs -f bigdata_bluetree
	
.PHONY: build run test clean
