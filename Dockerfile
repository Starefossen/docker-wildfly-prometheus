FROM jboss/wildfly

ADD node-info.war /opt/jboss/wildfly/standalone/deployments/

ADD jboss-logmanager-2.0.6.Final.jar /opt/jboss/wildfly
ADD jmx_prometheus_javaagent-0.9.jar /opt/jboss/wildfly
ADD prometheus-config.yaml /opt/jboss/wildfly

ENV JAVA_OPTS "-Xms64m -Xmx512m -XX:MetaspaceSize=96M -XX:MaxMetaspaceSize=256m \
  -Djava.net.preferIPv4Stack=true \
  -Djava.awt.headless=true \
  -Djboss.modules.metrics=true \
  -Djava.util.logging.manager=org.jboss.logmanager.LogManager \
  -Djboss.modules.system.pkgs=org.jboss.byteman,org.jboss.logmanager \
  -Xbootclasspath/p:/opt/jboss/wildfly/jboss-logmanager-2.0.6.Final.jar \
  -javaagent:/opt/jboss/wildfly/jmx_prometheus_javaagent-0.9.jar=\
31500:/opt/jboss/wildfly/prometheus-config.yaml"
