#!/bin/bash

# Set the password specified for the database.
if [[ ! -f /.set_password ]]; then
    sed -i "s/\%password\%/$MAILDB_PASSWORD/g" /docker-entrypoint-initdb.d/setup_db.sql
    touch /.set_password
fi

# Run the original entrypoint.
exec /usr/local/bin/docker-entrypoint.sh "$@"
