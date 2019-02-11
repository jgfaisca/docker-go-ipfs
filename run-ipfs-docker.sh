#!/bin/bash
#
# Create docker container
#

if [ "$#" -ne 2 ]; then
 echo
 echo "Usage: ./$(basename $0) <container_name> <ip_address>"
 echo
 exit 1
fi

STAGING_DIR="/opt/docker/export"
DATA_DIR="/opt/docker/data"

# Docker image
IMG="demo/go-ipfs"
TAG="latest"

# Docker network
NET_NAME="isolated_nw"
IP_ADDRESS="$2"

# Docker IPFS container
IPFS_CT="$1"

docker run -d \
	--net $NET_NAME --ip $IP_ADDRESS \
	--name $IPFS_CT \
	--restart=always \
	--volume $STAGING_DIR/$IPFS_CT:/export --volume $DATA_DIR/$IPFS_CT:/data/ipfs \
	-p 4001:4001 -p 5001:5001 -p 8080:8080 \
	$IMG:$TAG




