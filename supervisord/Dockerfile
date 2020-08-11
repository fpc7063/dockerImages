FROM debian:bullseye

LABEL maintainer="fpc7063" contact="francisco.pc@sempreceub.com"

ENV DEBIAN_FRONTEND noninteractive


#Update dependencies #DEBUG TOOLS
RUN apt update \
&& apt install -y vim net-tools telnet curl procps \ 
&& apt install -y python git ca-certificates iproute2
#INSTALL DEPENDENCIES


#Add diretorio src
ADD src /tmp/src
RUN chmod 700 /tmp/src/*




#MariaDB install
RUN apt install -y mariadb-server

#DB USER config
RUN service mysql start && \
mysqladmin password "Uniceub2020" && \
mysql -e "CREATE USER 'uniceub'@localhost IDENTIFIED BY 'uniceub';"
# Define mountable directories.
#######VOLUME ["/etc/mysql", "/var/lib/mysql"]
# Define working directory.
#######WORKDIR /data



#Apache modsec2 install/config
RUN /tmp/src/apache2-setup.sh && \
rm /tmp/src/apache2-setup.sh




#pip install supervisor
#SUPERVISOR - Monitore e controle diversos processos no linux
RUN /tmp/src/install-supervisor.sh && \
rm /tmp/src/install-supervisor.sh











#CONFIG FOR Image Development
ADD development.sh /tmp/development.sh
RUN chmod +x /tmp/development.sh
ENTRYPOINT ["/bin/bash"]


#NETWORK CONFIGURATION
EXPOSE 80/tcp
#EXPOSE 443/tcp
EXPOSE 3306


#ENTRYPOINT [ "/bin/sh" ]
CMD ["/tmp/development.sh"]