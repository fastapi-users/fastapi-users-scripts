#! /bin/bash

set -e

DB_LIBRARIES=$(ls ../ | grep "fastapi-users-db")

for db_library in $DB_LIBRARIES; do
    echo $db_library
    if [ $db_library != "fastapi-users-db-cookiecutter" ]; then
        source ../$db_library/venv/bin/activate
        pip install --upgrade pip
        pip install -U -r ../$db_library/requirements.dev.txt
        deactivate
    fi;
done;
