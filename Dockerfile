FROM ruby:2.6.3

# Install Node
RUN curl --silent --show-error --location https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get update
RUN apt-get install -y nodejs

# Install yarn
RUN curl --silent --show-error --location https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update 
RUN apt-get install -y yarn

ENV APP_HOME /app
ADD . $APP_HOME
WORKDIR $APP_HOME

RUN gem install bundler:2.2.29
RUN bundle install
RUN yarn install

RUN rm -f db/development.sqlite3
RUN rm -f db/test.sqlite3
RUN ./bin/rails db:setup
RUN ./bin/rails db:seed

EXPOSE 3000

CMD ["./bin/rails", "server", "-b", "0.0.0.0"]