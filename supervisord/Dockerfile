FROM debian:bullseye

LABEL maintainer="fpc7063" contact="francisco.pc@sempreceub.com"

ENV DEBIAN_FRONTEND noninteractive

#TUTORIAL
#https://medium.com/@karthi.net/how-to-run-multiple-services-in-a-docker-container-5919fcc981a6


#Update dependencies #DEBUG TOOLS
RUN apt update \
&& apt install -y vim net-tools telnet curl procps \ 
&& apt install -y python git ca-certificates iproute2
#INSTALL DEPENDENCIES


#pip install supervisor
#SUPERVISOR - Monitore e controle diversos processos no linux
RUN /tmp/src/install-supervisor.sh && \
rm /tmp/src/install-supervisor.sh











#CONFIG FOR Image Development
ADD development.sh /tmp/development.sh
RUN chmod +x /tmp/development.sh
ENTRYPOINT ["/bin/bash"]



#ENTRYPOINT [ "/bin/sh" ]
CMD ["/tmp/development.sh"]