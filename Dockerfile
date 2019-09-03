FROM ruby:2.6.0

RUN apt-get update -yqq \
  && apt-get install -yqq --no-install-recommends \
    postgresql-client \
    nodejs \
  && rm -rf /var/lib/apt/lists

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install
COPY . .