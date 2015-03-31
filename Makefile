build:
	sudo docker.io build -t aoki/bigdata .

run:
	sudo docker.io run -d --restart="always" -v /tmp/bigdata:/tmp -v /opt/bigdata/webapps:/usr/local/tomcat/webapps -v /opt/bigdata:/opt/bigdata -t -p 8081:8080 --name="bigdata_bluetree" aoki/bigdata

bash:
	sudo docker.io run -it --rm -v /tmp/bigdata:/tmp -v /opt/bigdata/webapps:/usr/local/tomcat/webapps -v /opt/bigdata:/opt/bigdata aoki/bigdata /bin/bash

ps:
	sudo docker.io ps

stop:
	sudo docker.io stop bigdata_bluetree

rm:
	sudo docker.io rm bigdata_bluetree

ip:
	sudo docker.io inspect -f "{{ .NetworkSettings.IPAddress }}" bigdata_bluetree

restart:
	sudo docker.io restart bigdata_bluetree

dump:
	sudo docker.io export bigdata_bluetree > bigdata.tar

load:
	cat bigdata.tar.gz | docker import - aoki/bigdata:bigdata_bluetree
	
clean: stop rm build run
	echo "cleaned."

logs:
	sudo docker.io logs -f bigdata_bluetree
	
.PHONY: build run test clean
