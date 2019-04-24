FROM gingray/ruby-node:2.6.1-8

RUN apk add --no-cache tzdata postgresql-dev build-base sqlite socat sqlite-dev

WORKDIR /app

ENV RAILS_ENV=production
ENV NODE_ENV=production

COPY Gemfile Gemfile.lock /app/
RUN gem update --system
RUN gem update --remote bundler
RUN bundle install --jobs 4 --without development:test --deployment

COPY . /app/

RUN bin/rails assets:precompile

EXPOSE 3000

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
