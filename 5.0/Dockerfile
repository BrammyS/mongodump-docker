FROM ubuntu:20.04
LABEL maintainer "BrammyS <https://github.com/BrammyS>"
VOLUME /backups

# Update local pacakges.
RUN apt-get update --no-install-recommends

# Install mongodb-tools. Needed for the mongodump command.
COPY ./5.0/mongodb-tools-100.5.3.deb /mongodb-tools-100.5.3.deb
RUN apt-get install --no-install-recommends -y /mongodb-tools-100.5.3.deb

# Install Cron.
RUN apt-get -y install cron

# Cleanup the local pacakges.
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Add shell scripts.
COPY ./5.0/mongodump.sh /mongodump.sh
RUN chmod +x /mongodump.sh

# Add the cron job.
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]

# Start cron in the foreground.
CMD [ "cron", "-f" ]