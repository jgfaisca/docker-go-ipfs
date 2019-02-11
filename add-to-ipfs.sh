#!/bin/bash
#
# Add host file/dir to IPFS container
#

if [ "$#" -ne 1 ]; then
 echo
 echo "Usage: ./$(basename $0) <file/dir>"
 echo
 exit 1
fi

# Host staging directory
STAGING_DIR="/opt/docker/data/ipfs-export"

# IPFS container
IPFS_CT="ipfs-node"

# copy file/dir to staging directory
cp -r $1 $STAGING_DIR

# add file/dir to IPFS container
docker exec $IPFS_CT ipfs add -r /export/$1
