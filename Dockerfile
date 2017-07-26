FROM ruby:slim
MAINTAINER n0trace <n0trace@protonmail.com>

RUN gem install certificate_authority

COPY docker-entrypoint.sh docker-entrypoint.sh
COPY certgen.rb certgen.rb

RUN chmod +x docker-entrypoint.sh

ENTRYPOINT ["./docker-entrypoint.sh"]