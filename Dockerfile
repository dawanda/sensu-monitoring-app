FROM ubuntu:14.04

ENV DEBIAN_FRONTEND="noninteractive"
ARG SENSU_URL
ARG BASIC_AUTH_USER_PASSWORD=""

RUN apt-get -qqy update && \
    apt-get -qqy install apt-transport-https

# From install script https://deb.nodesource.com/setup_5.x
ADD https://deb.nodesource.com/gpgkey/nodesource.gpg.key /tmp/nodesource.gpg.key
RUN apt-key add /tmp/nodesource.gpg.key && rm -f /tmp/nodesource.gpg.key
RUN echo "deb https://deb.nodesource.com/node_5.x trusty main" > /etc/apt/sources.list.d/nodesource.list && \
    echo "deb-src https://deb.nodesource.com/node_5.x trusty main" >> /etc/apt/sources.list.d/nodesource.list

RUN apt-get -qqy update && \
    apt-get -qqy upgrade
RUN apt-get -qqy install nodejs git

RUN npm install -g ionic bower gulp cordova

ADD package.json bower.json .bowerrc /src/
WORKDIR /src
# FIXME: why can not add to package.json?
RUN npm install process-nextick-args util-deprecate clone

RUN npm install && \
    bower --allow-root install

# Add full content here to cache npm install
ADD . /src/

RUN sed -i \
      -e "s,YOUR_SENSU_URL_BASE_API,$SENSU_URL," \
      -e "s,YOUR_BASIC_AUTH_USER_PASSWORD,$BASIC_AUTH_USER_PASSWORD," www/js/app.js && \
    sed -i \
      -e "s,YOUR_SENSU_URL_BASE_API,$SENSU_URL," \
      -e "s,YOUR_BASIC_AUTH_USER_PASSWORD,$BASIC_AUTH_USER_PASSWORD," www/dist/app.js
RUN gulp

EXPOSE 8100 35729

CMD ["ionic", "serve", "--address", "0.0.0.0"]
