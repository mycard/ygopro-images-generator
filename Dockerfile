FROM ruby

RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y wine32 xvfb

RUN bundle config --global frozen 1
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle install
COPY . /usr/src/app

ENV DISPLAY=:0.0
CMD ["./entrypoint.sh"]
