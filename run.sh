#!/bin/bash
#
# Docker container entrypoint
#

set -eo pipefail

if [ ! -f $IPFS_PATH/config ]; then
   ipfs init
   ipfs cat /ipfs/QmYwAPJzv5CZsnA625s3Xf2nemtYgPpHdWEz79ojWnPbdG/readme
fi

exec "$@"
