#!/usr/bin/env bash

set -e

#############################################
# POSTFIX
#############################################

# POSTFIX_var env -> postconf -e var=$POSTFIX_var
for e in ${!POSTFIX_*} ; do postconf -e "${e:8}=${!e}" ; done

service postfix start
