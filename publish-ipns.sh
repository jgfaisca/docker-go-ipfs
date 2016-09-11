
#!/bin/bash
#
# Publish to a permanent uri using IPFS/IPNS
# uri = /ipns/<PEER_ID>/<FILE_NAME>
#
# Step 1 - Create a publish directory
# e.g. > mkdir -p $HOME/publish
#
# Step 2 - Copy files to the publish directory
# e.g. > cp index.html $HOME/publish
#
# Step 3 - Run the script
# e.g. > ./publish-ipns.sh $HOME/publish/
#
# Whenever you update your files, just do step 3
# again, and IPNS will make sure anyone asking for
# your peerID gets the hash of your latest files.
#


# validate args
if [ $# -ne 1 ] ; then
   echo ""
   echo "Usage: ${0} '<directory>"
   echo "<directory> directory to publish"
   echo ""
   exit 1
fi

# generate uri
DIR="$1"
OUTPUT1=$(ipfs add $FILE --recursive | tail -1) # file hash
DIR_HASH=$(echo $OUTPUT1 | awk '{print $2}' | xargs)
OUTPUT2=$(ipfs name publish $DIR_HASH)
OUTPUT3=$(echo $OUTPUT2 | awk '{print $3}' | xargs)
PEER_ID=${OUTPUT3: : -1} # Peer ID
OUTPUT4=$(ipfs name resolve $PEER_ID)

# check
if [ "$OUTPUT4" == "/ipfs/$DIR_HASH" ] ; then
	URI="/ipns/$PEER_ID/" # URI
	echo $URI
	exit 0
   else
	echo "ERROR ..."
	exit 1
fi
