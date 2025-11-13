#!/bin/bash

docker compose exec -T mongos mongosh --port 27017 --quiet <<EOF
use somedb
    db.helloDoc.createIndex({"name": 1})
    sh.shardCollection("somedb.helloDoc", { "name": "hashed" })
EOF
