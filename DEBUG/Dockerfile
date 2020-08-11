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




CMD ["/tmp/development.sh"]