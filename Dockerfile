# syntax=docker/dockerfile:1
FROM ruby:2.6
RUN apt-get update -qq && apt-get install -y \
  nodejs \
  npm \
  postgresql-client \
  build-essential \ 
  cmake \ 
  software-properties-common \ 
  pkg-config \ 
  openssl \ 
  libssl-dev 
RUN npm install -g yarn
RUN gem install mini_portile2

WORKDIR /app
COPY ./code /app
RUN bundler install
RUN yarn
RUN rails webpacker:install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
