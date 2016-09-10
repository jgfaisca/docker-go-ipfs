
#!/bin/bash
#
# Generate a file permanent uri using IPFS/IPNS
# uri = /ipns/<PEER_ID>/<FILE_NAME>
#

# validate args
if [ $# -ne 1 ] ; then
   echo ""
   echo "Usage: ${0} '<file>'"
   echo "<file> file name used to generate a permanent uri"
   echo ""
   exit 1
fi

# generate uri
FILE="$1"
FILE_NAME=$(basename $FILE) # file name
FILE_HASH=$(ipfs add $FILE) # file hash
OUTPUT2=$(ipfs name publish $(echo $FILE_HASH | awk '{print $2}' | xargs))
OUTPUT3=$(echo $OUTPUT2 | awk '{print $3}' | xargs)
PEER_ID=${OUTPUT3: : -1} # Peer ID
URI="/ipns/$PEER_ID/$FILE_NAME" # URI
echo $URI
