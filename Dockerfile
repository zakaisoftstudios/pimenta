FROM ruby:2.4-slim
LABEL author=gouvermxt@gmail.com
LABEL version=1.0

RUN apt-get update \ 
  && apt-get install -y --no-install-recommends apt-utils build-essential patch  pkg-config git libpq-dev cron nodejs ruby-dev liblzma-dev libxslt-dev libxml2-dev  zlib1g-dev

ENV app /app
RUN mkdir $app
WORKDIR $app

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN bundle install \ 
  && echo 'require "awesome_print"' >> ~/.irbrc \ 
  && echo 'AwesomePrint.irb!' >> ~/.irbrc \
  && bundle exec rails db:create RAILS_ENV=${RACK_ENV} \
  && bundle exec rails db:migrate RAILS_ENV=${RACK_ENV}

COPY . .

EXPOSE 3003
EXPOSE 1234
EXPOSE 26162

RUN gem install bundler --version 1.17.3

RUN bundle exec whenever --update-crontab

CMD service cron start && bundle exec puma -t 5:5 -p ${PORT:-3003} -e ${RACK_ENV}
