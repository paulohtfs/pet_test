FROM ruby:2.6-slim

RUN apt-get update -qq && \
    apt-get install -y \
      build-essential \
      patch \
      ruby-dev \
      zlib1g-dev \
      liblzma-dev \
      libpq-dev \
      postgresql-client

ENV app /app/
ENV BUNDLE_PATH /box

WORKDIR $app
COPY . $app
RUN bundle install

ENTRYPOINT bin/run
