#!/bin/bash

set -e

docker compose exec -T configsvr mongosh --port 27019 --quiet <<EOF
    rs.initiate({
        _id: "configrs",
        configsvr: true,
        members: [
            { _id: 0, host: "configsvr:27019" }
        ]
    })
EOF
