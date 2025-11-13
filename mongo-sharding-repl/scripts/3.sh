#!/bin/bash

docker compose exec -T mongos mongosh --port 27017 --quiet <<EOF
    sh.addShard("shard1_r/shard1_p:27018,shard1_s1:27018,shard1_s2:27018")
    sh.addShard("shard2_r/shard2_p:27020,shard2_s1:27020,shard2_s2:27020")
    sh.enableSharding("somedb")
EOF
