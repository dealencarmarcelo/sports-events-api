FROM ruby:3.1.0-alpine

ENV APP_PATH /var/app
ENV BUNDLE_VERSION 2.3.3
ENV BUNDLE_PATH /usr/local/bundle/gems
ENV TMP_PATH /tmp/
ENV RAILS_LOG_TO_STDOUT true
ENV RAILS_PORT 3000

COPY ./dev-docker-entrypoint.sh /usr/local/bin/dev-entrypoint.sh
COPY ./test-docker-entrypoint.sh /usr/local/bin/test-entrypoint.sh

RUN chmod +x /usr/local/bin/dev-entrypoint.sh && chmod +x /usr/local/bin/test-entrypoint.sh

RUN apk -U add \
build-base \
git \
postgresql-dev \
postgresql-client \
libxml2-dev \
libxslt-dev \
nodejs \
yarn \
imagemagick \
tzdata \
less \
sqlite-dev \
&& rm -rf /var/cache/apk/* \
&& mkdir -p $APP_PATH

RUN gem install bundler --version "$BUNDLE_VERSION" \
&& rm -rf $GEM_HOME/cache/*

WORKDIR $APP_PATH

EXPOSE $RAILS_PORT

ENTRYPOINT ["bundle", "exec"]