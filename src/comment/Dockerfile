FROM ruby:2.2
# hadolint ignore=DL3008
RUN apt-get update -qq \
    && apt-get install -y --no-install-recommends build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile* $APP_HOME/
RUN bundle install
COPY . $APP_HOME

ENV COMMENT_DATABASE_HOST comment_db
ENV COMMENT_DATABASE comments

CMD ["puma"]
