FROM ubuntu:15.04

MAINTAINER Tom Marks

# Install essentials
RUN ["apt-get", "update"]
RUN ["apt-get", "install", "-y", "build-essential", "zlib1g-dev", "libssl-dev", "libreadline6-dev", "libyaml-dev"] 
RUN ["apt-get", "install", "-y", "curl"]

# Install ruby and bundler and gems fron Gemfile
RUN ["gpg", "--keyserver", "hkp://keys.gnupg.net", "--recv-keys", "409B6B1796C275462A1703113804BB82D39DC0E3"]
RUN /bin/bash -c "curl -sSL https://get.rvm.io | bash -s stable --ruby --gems=bundler"
RUN /bin/bash -c "echo 'source /usr/local/rvm/scripts/rvm' >> ~/.bashrc"
COPY ["Gemfile", "/tmp/Gemfile"]
WORKDIR "/tmp"
RUN /bin/bash --login -c "bundle install"

# Install node 5.1.0
RUN /bin/bash -c "curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash"
RUN /bin/bash -c "source /root/.nvm/nvm.sh; nvm install 5.1.0"

# start jekyll dev server
VOLUME "/blog"
EXPOSE 4000
WORKDIR "/blog"
ENTRYPOINT /bin/bash --login -c "source /root/.nvm/nvm.sh && nvm use 5 && bundle exec jekyll serve"
