#!/bin/bash
#
# Docker container entrypoint
#

set -eo pipefail

if [ ! -f $IPFS_PATH/config ]; then
   ipfs init   
fi

exec "$@"
