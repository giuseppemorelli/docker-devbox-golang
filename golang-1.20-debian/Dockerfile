FROM debian:bookworm

MAINTAINER Giuseppe Morelli <hello@giuseppemorelli.net>

VOLUME /home/gouser/

ENV USER_UID     1000
ENV USER_GID     1000
ENV DEBIAN_FRONTEND noninteractive

RUN useradd gouser \
    && mkdir -p /home/gouser \
    && chown -R gouser:gouser /home/gouser \
    && usermod -aG sudo gouser \
    && echo "gouser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

#RUN apt-get -y update \
#    && apt-get -y install \
#    git \
#    apache2 \
#    php5 \
#    php5-cli \
#    php5-curl \
#    php5-dev \
#    php5-gd \
#    php5-intl \
#    php5-mcrypt \
#    php5-mysql \
#    php5-xsl \
#    php-pclzip \
#    php5-json \
#    php5-xdebug \
#    php5-redis \
#    php-soap \
#    php-pear \
#    postfix \
#    wget \
#    unzip \
#    && apt-get clean \
#    && rm -rf \
#    /var/lib/apt/lists/* \
#    /tmp/* \
#    /var/tmp/* \
#    /usr/share/man \
#    /usr/share/doc \
#    /usr/share/doc-base

COPY script /opt/script/

ENV \
  POSTFIX_myhostname=hostname \
  POSTFIX_mydestination=localhost \
  POSTFIX_mynetworks=0.0.0.0/0 \
  POSTFIX_relayhost=''

CMD ["/opt/script/entrypoint.sh"]
