FROM ubuntu:24.04

LABEL maintainer="BrammyS <https://github.com/BrammyS>"
LABEL org.label-schema.name="brammys/mongodump"
LABEL org.label-schema.description="Backup your Mongodb database with cron inside of a docker container!"
LABEL org.label-schema.vendor="BrammyS"
LABEL org.label-schema.url="https://github.com/BrammyS/mongodump-docker"
LABEL org.label-schema.docker.cmd=" docker run -v ./localBackupsDir:/backups -e \"MONGO_URI=mongodb+srv://username:password@mongodb-cluster.mongodb.net\" -e DELETE_AFTER=14 -e \"CRON_SCHEDULE=0 5 * * sun\" --name mongodump brammys/mongodump"

VOLUME /backups

# Update local pacakges.
RUN apt-get update --no-install-recommends

# Install mongodb-tools. Needed for the mongodump command.
COPY ./8.0/mongodb-tools-100.10.0.deb /mongodb-tools-100.10.0.deb
RUN apt-get install --no-install-recommends -y /mongodb-tools-100.10.0.deb

# Install Cron.
RUN apt-get -y install cron

# Cleanup the local pacakges.
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Add shell scripts.
COPY ./8.0/mongodump.sh /mongodump.sh
RUN chmod +x /mongodump.sh

# Add the cron job.
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]

# Start cron in the foreground.
CMD [ "cron", "-f" ]