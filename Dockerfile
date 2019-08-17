FROM ruby:2.5.1

RUN apt-get update -qq &&  apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /crypto_wallet
WORKDIR /crypto_wallet

ADD Gemfile /crypto_wallet/Gemfile
ADD Gemfile.lock /crypto_wallet/Gemfile.lock

RUN bundle install

ADD . /crypto_wallet