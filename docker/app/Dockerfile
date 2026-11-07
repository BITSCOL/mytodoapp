FROM ruby:4.0.9-slim

RUN apt-get update -y && apt-get install -y build-essential nodejs git libpq-dev postgresql-client
WORKDIR /app

RUN gem install rails
COPY Gemfile Gemfile.lock ./
RUN bundle install

EXPOSE 3000

CMD ["rails", "s", "-b", "0.0.0.0"]
