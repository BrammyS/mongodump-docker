#!/bin/ash

# Add the mongodump shells script to crontab
touch crontab.tmp \
    && echo "${CRON_SCHEDULE:-"* * * * *"} /bin/ash -c /mongodump.sh" > crontab.tmp \
    && crontab crontab.tmp \
    && rm -rf crontab.tmp

# Start crond with log level 8 in foreground, output to stderr
crond -f -d 8