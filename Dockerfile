FROM ruby:alpine3.7
LABEL maintainer "Mario Álvarez <ahoy@m4grio.me>"

RUN \
    set -xe ;\
    gem install \
        bundler

RUN \
    set -xe ;\
    apk add \
        make \
        g++ \
    --no-cache

RUN \
    set -xe ;\
    gem install \
        jekyll

WORKDIR /opt/app
EXPOSE 4000

COPY docker_entrypoint.sh /bin/
ENTRYPOINT ["docker_entrypoint.sh"]
