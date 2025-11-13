#!/bin/bash

docker compose exec -T shard1 mongosh --port 27018 --quiet <<EOF
    rs.initiate({
        _id: "shard1_r",
        members: [
            { _id: 0, host: "shard1:27018" }
        ]
    })
EOF

docker compose exec -T shard2 mongosh --port 27020 --quiet <<EOF
    rs.initiate({
        _id: "shard2_r",
        members: [
            { _id: 0, host: "shard2:27020" }
        ]
    })
EOF
