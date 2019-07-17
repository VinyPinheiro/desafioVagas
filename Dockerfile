FROM ruby:2.5.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN useradd -ms /bin/bash  vagas
USER vagas
WORKDIR /vagas

ENV VAGAS_DB_PASSWORD vagas_pass
ENV VAGAS_DB_HOST postgres
ENV VAGAS_DB_USER vagas

ADD --chown=vagas:vagas . /vagas

RUN bundle install
