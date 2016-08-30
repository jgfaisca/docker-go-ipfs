#!/bin/bash
#
# Create docker container
#

if [ -z "$1" ]; then
 echo
 echo "Usage: ./$(basename $0) <container_name>"
 echo
 exit 1
fi

STAGING_DIR="/opt/docker/data/ipfs-export"
DATA_DIR="/opt/docker/data/ipfs"

IMG="zekaf/go-ipfs"
TAG="latest"

IPFS_CT="$1"

docker run -d \
	--restart=always \
	--volume $STAGING_DIR:/export --volume $DATA_DIR:/data/ipfs \
	-p 4001:4001 -p 5001:5001 -p 8080:8080 \
	--name $IPFS_CT \
	$IMG:$TAG




