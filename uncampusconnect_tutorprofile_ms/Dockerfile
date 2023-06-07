FROM ruby:3.1.3
WORKDIR /app
COPY Gemfile* ./
RUN bundle install
COPY .env /app/.env
COPY . .
ENV DB_NAME=uncampusconnect_tutorprofile_db
ENV DB_USER=postgres
ENV DB_PASSWORD=1234
ENV DB_HOST=127.0.0.1
ENV DB_PORT=5432
EXPOSE 3004
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3004"]
