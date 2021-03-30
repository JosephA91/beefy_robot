FROM ruby:2.7.2-alpine

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . /usr/src/app

CMD ["ruby", "play.rb"]
