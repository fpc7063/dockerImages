FROM debian:bullseye

LABEL maintainer="fpc7063" contact="francisco.pc@sempreceub.com"

ENV DEBIAN_FRONTEND noninteractive



#Update dependencies #DEBUG TOOLS
RUN apt update \
&& apt install -y vim net-tools telnet curl

#CONFIG FOR Image Development
ADD development.sh /tmp/development.sh
RUN chmod +x /tmp/development.sh





#Setup PYTHON
ADD ./src /tmp/src
RUN chmod +x /tmp/src/install-python3-8-5.sh && \
/tmp/src/install-python3-8-5.sh

#Setup DEPENDENCIES
RUN chmod +x /tmp/src/install-dependencies.sh && \
/tmp/src/install-dependencies.sh

#move project to workdir
RUN chmod +x /tmp/src/install-project.sh && \
/tmp/src/install-project.sh


#ENV SETUP
WORKDIR /opt/project
## ENVIRONMENT VARIABLES

ENTRYPOINT ["/bin/bash"]
CMD ["/tmp/development.sh"]