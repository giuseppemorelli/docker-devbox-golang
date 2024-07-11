#!/usr/bin/env bash

set -e

#############################################
# POSTFIX
#############################################

# POSTFIX_var env -> postconf -e var=$POSTFIX_var
for e in ${!POSTFIX_*} ; do postconf -e "${e:8}=${!e}" ; done

service postfix start

if [ "$USER_UID" != false ]; then
    usermod -u $USER_UID gouser
fi

if [ "$USER_GID" != false ]; then
    groupmod -g $USER_GID gouser
fi

chown $USER_UID:$USER_GID /home/gouser/ -R

tail -f /dev/null
