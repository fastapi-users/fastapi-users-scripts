#! /bin/bash

set -e

DB_LIBRARIES=$(ls ../ | grep "fastapi-users-db")

cd ../

for db_library in $DB_LIBRARIES; do
    echo $db_library
    if [ $db_library != "fastapi-users-db-cookiecutter" ]; then
        cd $db_library
        source venv/bin/activate
        make test
        deactivate
        cd ..
    fi;
done;
