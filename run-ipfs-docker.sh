#!/bin/bash
#
# Create docker container
#

STAGING_DIR="/opt/docker/data/ipfs-export"
DATA_DIR="/opt/docker/data/ipfs"

IMG="zekaf/go-ipfs"
TAG="latest"

IPFS_CT="ipfs-node"

docker run -d \
	--restart=always \
	--volume $STAGING_DIR:/export --volume $DATA_DIR:/data/ipfs \
	-p 4001:4001 -p 5001:5001 -p 8080:8080 \
	--name $IPFS_CT \
	$IMG:$TAG




