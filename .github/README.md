# mongodump-docker

Backup your Mongodb database with cron inside of a docker container!

## Examples

Run the backup task at 05:00 on Sunday and delete the backups after 14 days. 

```bash
 docker run -v ./localBackupsDir:/backups -e "MONGO_URI=mongodb+srv://username:password@mongodb-cluster.mongodb.net" -e DELETE_AFTER=14 -e "CRON_SCHEDULE=0 5 * * sun" --name mongodump brammys/mongodump:5.0
```

## Supported tags and respective `Dockerfile` links

* [`latest`, `5.0` (5.0/Dockerfile)](https://github.com/BrammyS/mongodump-docker/blob/main/5.0/Dockerfile)

## Configurations

| ENV variable    	| Default value           	| Description                                                                            	|
|-----------------	|-------------------------	|----------------------------------------------------------------------------------------	|
| `MONGO_URI`     	| `mongodb://mongo:27017` 	| The Mongodb URI                                                                        	|
| `CRON_SCHEDULE` 	| `0 0 * * *`             	| The cron schedule expression.                                                          	|
| `DELETE_AFTER`  	| ` `                      	| The amount of days after the backups will be deleted. Leave empty to keep all backups. 	|

## Volumes

| path       	| Description                           	|
|------------	|---------------------------------------	|
| `/backups` 	| The backup folder for the mongodumps. 	|
