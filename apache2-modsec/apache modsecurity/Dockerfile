FROM debian:bullseye

LABEL maintainer="fpc7063" contact="francisco.pc@sempreceub.com"

ENV DEBIAN_FRONTEND noninteractive


#Update dependencies #DEBUG TOOLS
RUN apt update \
&& apt install -y vim net-tools telnet curl procps \ 
&& apt install -y git ca-certificates iproute2



#Add diretorio src
ADD src /tmp/src
RUN chmod 700 /tmp/src/*


#Apache modsec2 install/config
RUN /tmp/src/apache2-setup.sh && \
rm /tmp/src/apache2-setup.sh




#CONFIG FOR Image Development
ADD development.sh /tmp/development.sh
RUN chmod +x /tmp/development.sh
ENTRYPOINT ["/bin/bash"]


#NETWORK CONFIGURATION
EXPOSE 80/tcp



#ENTRYPOINT [ "/bin/sh" ]
CMD ["apachectl", "-D", "FOREGROUND"]