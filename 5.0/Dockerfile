FROM alpine:3.16
LABEL maintainer "BrammyS <https://github.com/BrammyS>"

RUN apk add --no-cache mongodb-tools

ADD ./mongodump.sh /mongodump.sh
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /mongodump.sh & chmod +x /entrypoint.sh

VOLUME /backups

CMD ["./entrypoint.sh"]