#!/bin/bash
#
# Add host file/dir to IPFS container
#

if [ "$#" -ne 2 ]; then
 echo
 echo "Usage: ./$(basename $0) <container_name> <file/dir>"
 echo
 exit 1
fi

# Host staging directory
STAGING_DIR="/opt/docker/data/ipfs-export"

# IPFS container
IPFS_CT="$1"

# copy file/dir to staging directory
cp -r $2 $STAGING_DIR

# add file/dir to IPFS container
docker exec $IPFS_CT ipfs add -r /export/$2
