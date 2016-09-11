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

STAGING_DIR="/opt/docker/export"
DATA_DIR="/opt/docker/data"

# Docker image
IMG="zekaf/go-ipfs"
TAG="latest"

# Docker network
NET_NAME="isolated_nw"
IPFS_IP="10.17.0.6"

# Docker IPFS container
IPFS_CT="$1"

docker run -d \
	--net $NET_NAME --ip $IPFS_IP \
	--name $IPFS_CT \
	--restart=always \
	--volume $STAGING_DIR/$IPFS_CT:/export --volume $DATA_DIR/$IPFS_CT:/data/ipfs \
	-p 4001:4001 -p 5001:5001 -p 8080:8080 \
	$IMG:$TAG




