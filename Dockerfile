FROM ruby:2.3.1

# general
RUN usermod -u 1000 www-data
RUN \cp -fp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# tools
RUN apt-get update && apt-get install -y mysql-client redis-tools postgresql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*

# app dir
RUN mkdir -p /usr/src/app
# VOLUME /usr/src/app
WORKDIR /usr/src/app

# related ruby
COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle install -j4

# app
COPY . /usr/src/app

# related node (nvm)
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash
ENV NODE_VERSION 5.8.0
ENV NVM_DIR /home/yymm/.nvm
RUN . ~/.nvm/nvm.sh && nvm install $NODE_VERSION && nvm alias default $NODE_VERSION && npm install
# FIXME: commands above will be success but node/npm are missing when attaching (manual workaround: `nvm install [version]`) 
# FIXME: Node Sass could not find a binding for your current environment (manual workaround: `npm rebuild node-sass`) 

# EXPOSE 3000
EXPOSE 3000 1234 26162

# CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]
# CMD ["bundle", "exec", "unicorn", "-c", "config/unicorn.rb"]
CMD ["bash"]
