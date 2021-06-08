FROM debian:bullseye

LABEL maintainer="fpc7063" contact="francisco.pc@sempreceub.com"

ENV DEBIAN_FRONTEND noninteractive

#ENV SETUP
WORKDIR /opt

#CONFIG FOR Image Development
ADD development.sh /tmp/development.sh
RUN chmod +x /tmp/development.sh

# Dependencies
RUN apt update && apt install -y python3 pip bash
RUN pip install jupyterlab


#Port Exposing
EXPOSE 8888:8888/tcp
EXPOSE 8888:8888/udp

# User settings
RUN useradd -ms /bin/bash jupyterlab
RUN chown jupyterlab. /tmp/development.sh
USER jupyterlab

CMD [ "/tmp/development.sh" ]
#jupyter-lab --ip 0.0.0.0 --port 8888 --NotebookApp.token='' --NotebookApp.password=''
