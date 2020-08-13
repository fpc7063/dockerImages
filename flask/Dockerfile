FROM debian:bullseye

LABEL maintainer="fpc7063" contact="francisco.pc@sempreceub.com"

ENV DEBIAN_FRONTEND noninteractive



#Update dependencies #DEBUG TOOLS
RUN apt update \
&& apt install -y vim net-tools telnet curl

#CONFIG FOR Image Development
ADD development.sh /tmp/development.sh
RUN chmod +x /tmp/development.sh
ENTRYPOINT ["/bin/bash"]




#Setup PYTHON
ADD ./src /tmp/src
RUN chmod +x /tmp/src/install-python3-8-5.sh && \
/tmp/src/install-python3-8-5.sh
RUN python3.8 -m pip install --upgrade pip

RUN chmod +x /tmp/src/alias-config.sh && \
/tmp/src/alias-config.sh


#Setup FLASK
RUN chmod +x /tmp/src/install-flask.sh && \
/tmp/src/install-flask.sh




CMD ["/tmp/development.sh"]