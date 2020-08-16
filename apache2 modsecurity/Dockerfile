FROM debian:bullseye

LABEL maintainer="fpc7063" contact="francisco.pc@sempreceub.com"

ENV DEBIAN_FRONTEND noninteractive

#Update SO
RUN apt update && apt upgrade -y

#Install dependencies
RUN apt install -y git

#Add diretorio src
ADD ./src /tmp/src
RUN chmod 700 /tmp/src/apache2-setup.sh


#Apache modsec2 install/config
RUN /tmp/src/apache2-setup.sh && \
rm /tmp/src/apache2-setup.sh



#NETWORK CONFIGURATION
EXPOSE 80/tcp



CMD ["apachectl", "-D", "FOREGROUND"]