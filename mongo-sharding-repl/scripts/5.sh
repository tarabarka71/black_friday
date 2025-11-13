#!/bin/bash

docker compose exec -T mongos mongosh --port 27017 --quiet <<EOF
use somedb
    for(var i = 0; i < 3000; i++) {
        db.helloDoc.insertOne({
            age: i % 100,
            name: "user" + String(i).padStart(5, '0'),
            timestamp: new Date(),
            data: "sample_data_" + i
        })
    }
EOF

docker compose exec -T mongos mongosh --port 27017 --quiet <<EOF
use somedb
print("total:", db.helloDoc.countDocuments())
EOF

docker compose exec -T mongos mongosh --port 27017 --quiet <<EOF
use somedb
db.helloDoc.getShardDistribution()
EOF

docker compose exec -T shard1_p mongosh --port 27018 --quiet <<EOF
var status = rs.status()
status.members.forEach(function(member) {
  print(member.name, "-", member.stateStr)
})
EOF

docker compose exec -T shard2_p mongosh --port 27020 --quiet <<EOF
var status = rs.status()
	status.members.forEach(function(member) {
        	print(member.name, "-", member.stateStr)
    })
EOF