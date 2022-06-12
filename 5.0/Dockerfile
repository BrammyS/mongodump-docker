FROM alpine:3.16
LABEL maintainer "BrammyS <https://github.com/BrammyS>"

ARG CRON_SCHEDULE="* * * * *"

RUN apk add --no-cache mongodb-tools

ADD ./mongodump.sh /mongodump.sh
RUN chmod +x /mongodump.sh

RUN touch crontab.tmp \
    && echo "$CRON_SCHEDULE /bin/ash -c /mongodump.sh" > crontab.tmp \
    && crontab crontab.tmp \
    && rm -rf crontab.tmp

VOLUME /backups

# start crond with log level 8 in foreground, output to stderr
CMD ["crond", "-f", "-d", "8"]