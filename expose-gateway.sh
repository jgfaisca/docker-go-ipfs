#!/bin/bash
#
# Expose IPFS HTTP gateway to other computer in the network.
# (by default, the gateway is only accessible locally)
#

if [ -z "$1" ]; then
 echo
 echo "Usage: ./$(basename $0) <container_name>"
 echo
 exit 1
fi

# IPFS container
IPFS_CT="$1"

# Get current IPFS configuration
CURRENT_GW=$(docker exec ipfs-node ipfs config Addresses.Gateway)
CURRENT_PORT=$(echo -n $CURRENT_GW | tail -c 4)

# modify IPFS configuration
docker exec $IPFS_CT ipfs config Addresses.Gateway /ip4/0.0.0.0/tcp/$CURRENT_PORT

# restart container
docker restart $IPFS_CT
