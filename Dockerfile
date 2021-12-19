# syntax=docker/dockerfile:1
FROM ruby:3.0
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /mu-service-ruby

COPY Gemfile /mu-service-ruby/Gemfile
COPY Gemfile.lock /mu-service-ruby/Gemfile.lock
RUN gem install bundler && bundle install --jobs=3 --retry=3

COPY config.ru /mu-service-ruby/config.ru
COPY Procfile /mu-service-ruby/Procfile
COPY Rakefile /mu-service-ruby/Rakefile
COPY .rspec /mu-service-ruby/.rspec
ADD spec /mu-service-ruby/spec/
ADD routes /mu-service-ruby/routes/
ADD resources /mu-service-ruby/resources/
ADD lib /mu-service-ruby/lib/
ADD handlers /mu-service-ruby/handlers/
ADD config /mu-service-ruby/config/
COPY .env /mu-service-ruby/.env
RUN mkdir -p tmp/pids && touch tmp/pids/server.pid

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
