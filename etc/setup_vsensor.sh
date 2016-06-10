#!/bin/sh
#
# Copyright (c) 2016  InfoSec Consulting, Inc.
# All rights reserved.
# $FreeBSD$

# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# vars
is_pkg_server=http://pkg.insecure-it.com
file="/usr/local/etc/vscli"

# check if vcli exists
if [ -d "$file" ]
then

	printf "\nvscli exists, use vscli instead.\n\n"

else

    echo "Installing prerequisites"
    sleep 5

    is_pkgs="curl python35"
    pkg install -y ${is_pkgs}

    curl -L ${is_pkg_server}/distfiles/vscli.tar.gz -o /tmp/vscli.tar.gz
    cd /usr/local/etc/ && tar zxvf /tmp/vscli.tar.gz && ln -s ${file}/vscli.py /usr/local/bin/vscli
    ln -s /usr/local/bin/python3.5 /usr/local/bin/python
fi