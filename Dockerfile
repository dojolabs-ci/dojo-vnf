FROM dojolabs/dojo-os
RUN apt update
RUN apt -y install \
	busybox-syslogd \
	iptables \
	openjdk-8-jdk

COPY dojo-vnf.cron /etc/cron.d/dojo-vnf
RUN chmod 0644 /etc/cron.d/dojo-vnf

RUN curl https://s3-us-west-2.amazonaws.com/dojo-os/thirdparty-packages/apache-ignite_2.7.0-1_all.deb -o /tmp/apache-ignite_2.7.0-1_all.deb
RUN dpkg --force-all -i /tmp/apache-ignite_2.7.0-1_all.deb && rm -rf /tmp/apache-ignite_2.7.0-1_all.deb
COPY config/dojo_profile.sh  /etc/profile.d/dojo_profile.sh 
