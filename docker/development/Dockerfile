FROM ruby:2.7.1-alpine3.12 as build-base

RUN apk update && apk add \
  build-base \
  tzdata git \
  libffi-dev \
  python2 \
  postgresql-dev

RUN mkdir -p /app
WORKDIR /app

RUN echo "install: --no-rdoc --no-ri" >> ~/.gemrc
RUN echo "update:  --no-rdoc --no-ri" >> ~/.gemrc

RUN gem install bundler

RUN bundle config --global jobs $(nproc --all)

COPY Gemfile Gemfile.lock ./
RUN bundle install
