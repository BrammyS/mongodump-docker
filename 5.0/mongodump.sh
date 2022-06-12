#!/bin/ash

# date/time
TIME=`/bin/date +%d-%m-%Y_%H-%M`

echo "$TIME Starting mongodump"

# Dump from mongodb host into backup directory
/usr/bin/mongodump --uri "$MONGO_URI" --gzip --archive=/backups/$TIME