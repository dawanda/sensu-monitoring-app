FROM nodejs:5.x

ARG SENSU_URL
ARG BASIC_AUTH_USER_PASSWORD=""

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
      -e "s,YOUR_BASIC_AUTH_USER_PASSWORD,$BASIC_AUTH_USER_PASSWORD," www/js/app.js
RUN gulp

EXPOSE 8100 35729

CMD ["ionic", "serve", "--address", "0.0.0.0"]
