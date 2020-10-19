FROM debian:buster

#RUN apt update && apt upgrade -y
RUN apt update
RUN apt install -y wget sudo


RUN adduser elastic --gecos "First Last,RoomNumber,WorkPhone,HomePhone,HomePhone" --disabled-password \
&& echo "\nelastic ALL=(ALL) NOPASSWD:ALL" | tee -a /etc/sudoers
RUN adduser root sudo && adduser elastic sudo

#RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add - \
#&& echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee /etc/apt/sources.list.d/elastic-7.x.list


WORKDIR /tmp
RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.9.2-linux-x86_64.tar.gz \
&& wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.9.2-linux-x86_64.tar.gz.sha512 \
&& sha512sum -c elasticsearch-7.9.2-linux-x86_64.tar.gz.sha512 \
&& tar -xzf elasticsearch-7.9.2-linux-x86_64.tar.gz \
&& mv ./elasticsearch-7.9.2 /opt \
&& chown -R elastic. /opt/elasticsearch-7.9.2


WORKDIR /opt/elasticsearch-7.9.2
EXPOSE 9200
USER elastic


ENV ES_HOME "/opt/elasticsearch-7.9.2"
ENV ES_JAVA_OPTS "-Xmx3G -Xms3G"
ENV ANONYMOUS_USER true
ENV Ecluster.name "default_cluster"
ENV Enode.name "$HOSTNAME"
ENV Enetwork.bind_host "0.0.0.0"
ENV Ehttp.max_content_length "2000mb"


RUN sudo apt install -y vim net-tools
ADD run.sh /tmp/run.sh
RUN sudo chmod +x /tmp/run.sh
ENTRYPOINT ["/opt/elasticsearch-7.9.2/bin/elasticsearch"]

CMD ["-Ecluster.name=$Ecluster.name -Enode.name=$Enode.name -Enetwork.bind_host=$Enetwork.bind_host -Ehttp.max_content_length=$Ehttp.max_content_length"]