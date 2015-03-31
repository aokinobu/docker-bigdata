# simple BlazeGraph/BigData war file from source in tomcat

## More information available here: http://wiki.blazegraph.com

It would be a good idea to review the RWStore.properties file.

It can be specified via java system properties via:
-Dcom.bigdata.rdf.sail.webapp.ConfigParams.propertyFile=FILE

where FILE is the fully qualified path of the bigdata property file.

As written in the blazedgraph wiki:
You should specify JAVA_OPTS with at least the following properties. The guidelines for the maximum java heap size are no more than 1/2 of the available RAM. Heap sizes of 2G to 8G are good recommended to avoid long GC pauses. Larger heaps are possible with the G1 collector (in Java 7).

export JAVA_OPTS="-server -Xmx2g"
