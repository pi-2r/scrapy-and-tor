# Pull base image.
FROM ubuntu:latest

MAINTAINER ptherrode

# Upgrade system
RUN apt-get update && apt-get dist-upgrade -y --no-install-recommends && apt-get autoremove -y && apt-get clean

# Install packages
RUN apt-get install -y --no-install-recommends tor tor-geoipdb torsocks polipo && apt-get autoremove -y && apt-get clean
# INSTALL PYTHON
RUN apt-get install -y python2.7 python-pip python-dev build-essential libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev libxslt-dev libxml2-dev && apt-get clean

# INSTALL SCRAPY and dependencies
RUN pip install lxml && pip install pyopenssl && pip install Scrapy   && pip install pyopenssl  && pip install beautifulsoup4  && pip install lxml   && pip install elasticsearch   && pip install simplejson   && pip install requests  && rm -rf /var/lib/apt/lists/*

# Add image configuration and scripts
ADD run.sh /run.sh

