FROM debian:bullseye

LABEL maintainer="fpc7063" contact="francisco.pc@sempreceub.com"

ENV DEBIAN_FRONTEND noninteractive


#Update dependencies
RUN apt update
#RUN apt upgrade -y
#DEBUG TOOLS
RUN apt install -y vim net-tools telnet curl procps git \
python git ca-certificates iproute2





#MariaDB INSTALL: https://github.com/dockerfile/mariadb/blob/master/Dockerfile
RUN apt install -y mariadb-server

#settup config for user
RUN service mysql start && \
mysqladmin password "Uniceub2020" && \
mysql -e "CREATE USER 'uniceub'@localhost IDENTIFIED BY 'uniceub';"



#Apache settup
ADD apache2-setup.sh /tmp/apache2-setup.sh
ADD src /tmp/src
RUN chmod 700 /tmp/apache2-setup.sh
RUN /tmp/apache2-setup.sh
RUN rm /tmp/apache2-setup.sh


# Define mountable directories.
#######VOLUME ["/etc/mysql", "/var/lib/mysql"]
# Define working directory.
#######WORKDIR /data









EXPOSE 80/tcp
#EXPOSE 443/tcp
EXPOSE 3306

#CONFIG FOR TESTS
ADD run.sh /tmp/run.sh
RUN chmod +x /tmp/run.sh
ENTRYPOINT ["/bin/bash"]

#START
CMD ["/tmp/run.sh", "service mysql start", "service apache2 start"]