#!/bin/bash

docker compose exec -T mongos mongosh --port 27017 --quiet <<EOF
    sh.addShard("shard1_r/shard1:27018")
    sh.addShard("shard2_r/shard2:27020")
    sh.enableSharding("somedb")
EOF
