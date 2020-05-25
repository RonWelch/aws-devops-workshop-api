#!/bin/sh

# Exit the script as soon as something fails.
set -e

# Pull down and export the encrpyted DB password.
export MYSQL_PASSWORD=`aws ssm get-parameters --names ${SSM_DB_PWD} --with-decryption --output text --query 'Parameters[0].Value' --region ${AWS_DEFAULT_REGION}`

exec "$@"