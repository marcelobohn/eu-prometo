FROM ruby:2.3.3

# ENV RAILS_ENV production

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
ADD . /myapp

EXPOSE 3000

# RUN bundle exec rails s -p 3000 -b '0.0.0.0'
CMD [ "puma" ]
