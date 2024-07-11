FROM debian:bullseye

MAINTAINER Giuseppe Morelli <hello@giuseppemorelli.net>

VOLUME /home/gouser/

ENV USER_UID     1000
ENV USER_GID     1000
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update \
    && apt-get -y install \
    git \
    postfix \
    wget \
    unzip \
    sudo \
    && apt-get clean \
    && rm -rf \
    /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/* \
    /usr/share/man \
    /usr/share/doc \
    /usr/share/doc-base

RUN cd /tmp/ && wget https://go.dev/dl/go1.20.12.linux-amd64.tar.gz \
    && tar -xvf go1.20.12.linux-amd64.tar.gz \
    && mv go /usr/local/bin/

ENV GOROOT=/usr/local/bin/go
ENV PATH=$GOROOT/bin:$PATH

RUN useradd gouser \
    && mkdir -p /home/gouser \
    && chown -R $USER_UID:$USER_GID /home/gouser \
    && usermod -aG sudo gouser \
    && echo "gouser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

COPY script /opt/script/

ENV \
  POSTFIX_myhostname=hostname \
  POSTFIX_mydestination=localhost \
  POSTFIX_mynetworks=0.0.0.0/0 \
  POSTFIX_relayhost=''

CMD ["/opt/script/entrypoint.sh"]
