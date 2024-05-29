#!/bin/bash

mongod --bind_ip_all --fork --logpath /var/log/mongodb.log

COLLECTIONS=("Title" "Rating" "Name")

# Check if each collection exists before importing data
for COLLECTION in "${COLLECTIONS[@]}"; do
    mongosh --eval "db = db.getSiblingDB('IMDB'); printjson(db.getCollection('${COLLECTION}').exists())" | grep -q null

    EXISTS=$?
    if [ $EXISTS -eq 1 ]; then
        echo "Collection ${COLLECTION} already exists. Skipping import."
        break
    fi
done

if [ $EXISTS -eq 0 ]; then
    mongoimport --db IMDB --collection Title --type tsv --file /docker-entrypoint-initdb.d/title.basics.tsv --headerline
    mongoimport --db IMDB --collection Rating --type tsv --file /docker-entrypoint-initdb.d/title.ratings.tsv --headerline
    mongoimport --db IMDB --collection Name --type tsv --file /docker-entrypoint-initdb.d/name.basics.tsv --headerline
fi

tail -f /var/log/mongodb.log