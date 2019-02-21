#!/bin/bash

DOCKER=/usr/bin/docker
DUPLICITY=/usr/bin/duplicity

# output date so we can identify stuff in the logfile
/bin/date

# Step 1: update backup data from the running containers

CONTAINERDATA=/.../containerdata
WP_VARWWWHTML=${CONTAINERDATA}/mirror-wp-var-www-html
DB_WP_SQLDUMP=${CONTAINERDATA}/db-wp-sqldump.sql

# sync WP web data into host directory
${DOCKER} run --rm --volumes-from wordpress -v ${WP_VARWWWHTML}:/mirror instrumentisto/rsync-ssh rsync -av /var/www/html /mirror

# get current db data for wordpress database
${DOCKER} exec db mysqldump --user=<USER> --password=<PASSWORD> wordpress > ${DB_WP_SQLDUMP}


# get hold of credentials and the encryption passphrase
source /.../s3-env
export AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY
export PASSPHRASE=$(cat /.../secret_key.txt)

# duplicity backup parameters
DUP_ARGS="--full-if-older-than 1W --verbosity warning --volsize 250 --allow-source-mismatch --gpg-options --cipher-algo=AES256"

# duplicity remove parameters
DUP_REMOVE_ARGS="remove-older-than 3W --force"

# run backups
$DUPLICITY $DUP_ARGS /.../containerdata s3://s3.eu-west-2.amazonaws.com/.../setup-20181213-containerdata/ 
$DUPLICITY $DUP_ARGS /.../mailconfig s3://s3.eu-west-2.amazonaws.com/.../setup-20181213-mailconfig/ 

# remove old backups - these become old versions in bucket config
$DUPLICITY $DUP_REMOVE_ARGS s3://s3.eu-west-2.amazonaws.com/.../setup-20181213-containerdata/
$DUPLICITY $DUP_REMOVE_ARGS s3://s3.eu-west-2.amazonaws.com/.../setup-20181213-mailconfig/

unset PASSPHRASE
unset AWS_ACCESS_KEY_ID
unset AWS_SECRET_ACCESS_KEY
