FROM tomcat:8.0 
MAINTAINER Nobuyuki Paul Aoki <aokinobu@gmail.com>

RUN apt-get update

RUN apt-get -y install ant git-core default-jdk

WORKDIR /
RUN git clone http://git.code.sf.net/p/bigdata/git bigdata

WORKDIR /bigdata
#RUN git checkout tags/v7.0.0
RUN ant clean bundleJar war

WORKDIR /
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ADD run.sh /run.sh

WORKDIR /bigdata
CMD ["/run.sh"]
