#!/bin/bash

docker compose exec -T shard1_p mongosh --port 27018 --quiet <<EOF
    rs.initiate({
        _id: "shard1_r",
        members: [
            { _id: 0, host: "shard1_p:27018", priority: 3 },
            { _id: 1, host: "shard1_s1:27018", priority: 2 },
            { _id: 2, host: "shard1_s2:27018", priority: 1 }
        ]
    })
EOF

docker compose exec -T shard2_p mongosh --port 27020 --quiet <<EOF
    rs.initiate({
        _id: "shard2_r",
        members: [
            { _id: 0, host: "shard2_p:27020", priority: 3 },
            { _id: 1, host: "shard2_s1:27020", priority: 2 },
            { _id: 2, host: "shard2_s2:27020", priority: 1 }
        ]
    })
EOF