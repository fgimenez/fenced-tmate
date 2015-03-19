FROM ubuntu:14.04

MAINTAINER Federico Gimenez <fgimenez@canonical.com>

# Install packages
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:nviennot/tmate
RUN apt-get update && \
    apt-get install --no-install-recommends -y tmate openssh-client vim emacs24-nox && \
    apt-get clean && \
    yes | ssh-keygen -q -t rsa -N "" -f ~/.ssh/id_rsa 

# Create a workspace directory
RUN mkdir -p /workspace

ENTRYPOINT cd /workspace/ && /usr/bin/tmate
