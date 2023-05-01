FROM ruby:3.1.3
WORKDIR /app
COPY Gemfile* ./
RUN bundle install
COPY .env /app/.env
COPY . .
EXPOSE 3004
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3004"]