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

# IPFS container
IPFS_CT="$1"

# host staging directory
STAGING_DIR="/opt/docker/export/$IPFS_CT"

# copy file/dir to staging directory
cp -r $2 $STAGING_DIR

# add file/dir to IPFS container
if [ -d "$2" ]; then
   docker exec $IPFS_CT ipfs add -r /export/$2
else
   docker exec $IPFS_CT ipfs add /export/$2
fi
