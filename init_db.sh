#!/bin/bash
set -e

export DB_TEST="$POSTGRES_DB"_test

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE DATABASE $DB_TEST;
    GRANT ALL PRIVILEGES ON DATABASE $DB_TEST TO $POSTGRES_USER;
EOSQL