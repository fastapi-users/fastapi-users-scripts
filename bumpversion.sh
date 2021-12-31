#! /bin/bash

set -e

VERSION=$1
DB_LIBRARIES=$(ls ../ | grep "fastapi-users-db")

if [ -z "$VERSION" ]; then
    echo "Usage: ./bumpversion.sh patch|minor|major"
    exit 1
fi;

cd ../

for db_library in $DB_LIBRARIES; do
    echo $db_library
    if [ $db_library != "fastapi-users-db-cookiecutter" ]; then
        cd $db_library
        make bumpversion-$VERSION
        git push && git push --tags
        cd ..
    fi;
done;
