#!/bin/bash
#
# Add host files to IPFS container
#

if [ -z "$1" ]; then
 echo
 echo "Usage: ./$(basename $0) <file>"
 echo
 exit 1
fi

# Host directories
STAGING_DIR="/opt/docker/data/ipfs-export"
DATA_DIR="/opt/docker/data/ipfs"

# IPFS container
IPFS_CT="ipfs-node"

# copy files to staging directory
cp -r $1 $STAGING_DIR

# add file to IPFS container
docker exec $IPFS_CT ipfs add -r /export/$1
