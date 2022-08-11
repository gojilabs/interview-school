FROM ruby:2.6.10

# Install Node
RUN curl --silent --show-error --location https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get update
RUN apt-get install -y python nodejs

# Install yarn
RUN npm install -g yarn

ENV SRC_HOME /src
ADD . $SRC_HOME
WORKDIR $SRC_HOME

RUN gem install bundler:2.2.29
RUN bundle install
RUN yarn install

RUN rm -f db/development.sqlite3
RUN rm -f db/test.sqlite3
RUN ./bin/rails db:setup
RUN ./bin/rails db:seed

EXPOSE 3000

CMD ["./bin/rails", "server", "-b", "0.0.0.0"]