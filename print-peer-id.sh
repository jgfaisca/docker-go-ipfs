#!/bin/bash
#
# Print IPFS node ID
#

ID=$(ipfs id | grep ID | awk '{print $2}' | xargs)
ID=${ID%?}
echo "$ID"
