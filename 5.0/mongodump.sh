#!/bin/ash
echo "Starting mongodump"

TIME=`/bin/date +%d-%m-%Y_%H-%M`
DEST="/backups"

# Dump from mongodb host into backup directory
/usr/bin/mongodump --uri "${MONGO_URI:-"mongodb://mongo:27017"}" --gzip --archive=$DEST/$TIME

if [[ -z "${DELETE_AFTER}" ]]; then
    echo "DELETE_AFTER was not set. Not deleting old backups"
else
    echo "Deleting backups older then $DELETE_AFTER days"
    find $DEST -type f -ctime +$DELETE_AFTER -exec rm -rf {} \;
fi