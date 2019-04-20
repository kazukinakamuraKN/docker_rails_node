FROM ruby:2.5.1
ENV LANG C.UTF-8
RUN apt-get update -qq
RUN apt-get install -y build-essential libpq-dev vim nodejs
RUN mkdir rails_react_tutorial \
    && cd /rails_react_tutorial \
    && gem install bundler \
    && gem install rails -v 5.1.0 \
    && bundle init \
    && echo "gem 'rails', '~> 5.1.0'" >> Gemfile \
    && bundle install \
    && rails new . --webpack=react --api
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
apt-get update && apt-get install -y yarn
# Node.jsをインストール
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - && \
apt-get install nodejs
