FROM dojolabs/dojo-os
RUN apt update && apt -y install \
			busybox-syslogd \
			iptables \
			openvswitch-common \
			openjdk-8-jdk

COPY dojo-vnf.cron /etc/cron.d/dojo-vnf
RUN chmod 0644 /etc/cron.d/dojo-vnf

RUN curl https://s3-us-west-2.amazonaws.com/dojo-os/thirdparty-packages/apache-ignite-8.7.5.tar.gz -o /tmp/apache-ignite-8.7.5.tar.gz
RUN mkdir -p /usr/share/apache-ignite/ 
RUN tar -xf /tmp/apache-ignite-8.7.5.tar.gz -C /opt/
RUN ln -s /opt/apache-ignite-8.7.5/benchmarks /usr/share/apache-ignite
RUN rm -rf /tmp/*
COPY config/dojo_profile.sh  /etc/profile.d/dojo_profile.sh
