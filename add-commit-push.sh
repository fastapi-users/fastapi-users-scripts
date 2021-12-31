#! /bin/bash

set -e

COMMIT_MESSAGE=$1
DB_LIBRARIES=$(ls ../ | grep "fastapi-users-db")

if [ -z "$COMMIT_MESSAGE" ]; then
    echo "Usage: ./add-commit-push.sh 'My commit message'"
    exit 1
fi;

cd ../

for db_library in $DB_LIBRARIES; do
    echo $db_library
    if [ $db_library != "fastapi-users-db-cookiecutter" ]; then
        cd $db_library
        if [ -n "$(git status --porcelain)" ]; then
            git add -u
            git commit -m "$1"
            git push
        fi;
        cd ..
    fi;
done;
