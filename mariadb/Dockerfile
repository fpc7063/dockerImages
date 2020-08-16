FROM debian:buster

LABEL maintainer="fpc7063" contact="francisco.pc@sempreceub.com"

ENV DEBIAN_FRONTEND noninteractive


#Update dependencies #DEBUG TOOLS
RUN apt update
#INSTALL DEPENDENCIES


#MariaDB install
RUN apt install -y mariadb-server vim net-tools

#DB USERS
RUN service mysql start && \
mysql -e "CREATE DATABASE uniceub;" && \
mysql -e "CREATE USER  'uniceub'@'0.0.0.0' IDENTIFIED BY 'uniceub';" && \
mysql -e "GRANT ALL ON *.* to 'uniceub'@'172.17.0.1' IDENTIFIED BY 'uniceub' WITH GRANT OPTION;" && \
mysql -e "FLUSH PRIVILEGES;" && \
service mysql stop


# Define mountable directories.
#######VOLUME ["/etc/mysql", "/var/lib/mysql"]
# Define working directory.
#######WORKDIR /data

RUN echo "\n[mysqld]\nbind-address = 0.0.0.0" | tee -a /etc/mysql/my.cnf

#CONFIG FOR Image Development
ADD development.sh /tmp/development.sh
RUN chmod +x /tmp/development.sh
ENTRYPOINT ["/bin/bash"]


#NETWORK CONFIGURATION
EXPOSE 3306


#ENTRYPOINT [ "/bin/sh" ]
CMD ["/tmp/development.sh"]