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
  && echo 'AwesomePrint.irb!' >> ~/.irbrc

COPY . .

EXPOSE 3003

CMD bash ./k8s/entrypoint.sh
