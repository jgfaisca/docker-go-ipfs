#!/bin/bash
#
# Opens a new direct connection to a peer (IPFS node) address
#

if [ "$#" -ne 2 ]; then
   echo ""
   echo "Usage: ${0} <ip_address> <id>"
   echo "<ip_address> peer IP address"
   echo "<id> peer ID"
   exit 1
fi

IP_ADDRESS="$1"
ID="$2"
PORT=4001
CMD="ipfs swarm connect /ip4/${IP_ADDRESS}/tcp/${PORT}/ipfs/${ID}"
echo $CMD
eval $CMD
