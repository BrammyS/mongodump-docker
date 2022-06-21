#!/bin/bash
set -e

# Export the docker env vars so they are accessible on the cron job.
printenv | grep -v "no_proxy" >> /etc/environment

# Add the mongodump shells script to crontab
touch crontab.tmp \
    && echo "${CRON_SCHEDULE:-"0 0 * * *"} /bin/bash -c /mongodump.sh > /proc/1/fd/1 2>/proc/1/fd/2" > crontab.tmp \
    && crontab crontab.tmp \
    && rm -rf crontab.tmp

exec "$@"