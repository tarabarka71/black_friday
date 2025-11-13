#!/bin/bash

docker compose exec -T mongos mongosh <<EOF
use somedb
for(var i = 0; i < 1100; i++) db.helloDoc.insertOne({age:i, name:"ly"+i})
EOF

docker compose exec -T mongos mongosh --port 27017 --quiet <<EOF
use somedb
var totalCount = db.helloDoc.countDocuments()
print("total:", totalCount)
EOF

docker compose exec -T shard1 mongosh --port 27018 --quiet <<EOF
use somedb
var shard1Count = db.helloDoc.countDocuments()
print("shard1_r docs:", shard1Count)
EOF

docker compose exec -T shard2 mongosh --port 27020 --quiet <<EOF
use somedb
var shard2Count = db.helloDoc.countDocuments()
print("shard2_r docs:", shard2Count)
EOF
