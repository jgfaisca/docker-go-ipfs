
#!/bin/bash
#
# Publish to a permanent uri using IPFS/IPNS
# and a key for different content and/or contexts
# uri = /ipns/<PEER_ID>/<FILE_NAME>
#
# Step 1 - Create a publish directory
# example#  mkdir -p $HOME/publish
#
# Step 2 - Copy files to the publish directory
# example# cp index.html $HOME/publish
#
# Step 3 - Run the script
# example# ./publish-ipns-key.sh $HOME/publish/ keyname
#
# Whenever you update your files, just do step 3
# again, and IPNS will make sure anyone asking for
# your peerID gets the hash of your latest files.
#


# validate args
if [ "$#" -ne 2 ]; then
   echo ""
   echo "Usage: ${0} <directory> <key_name>"
   echo "<directory> directory to publish"
   echo "<key_name> key name"
   exit 1
fi

# run
DIR="$1"
KEY=$(ipfs key gen --type=rsa --size=2048 $2)
OUTPUT1=$(ipfs add --silent $DIR --recursive | tail -1)
DIR_HASH=$(echo $OUTPUT1 | awk '{print $2}' | xargs)
OUTPUT2=$(ipfs name publish --key=$KEY $DIR_HASH)
OUTPUT3=$(echo $OUTPUT2 | awk '{print $3}' | xargs)
PEER_ID=${OUTPUT3: : -1}
OUTPUT4=$(ipfs name resolve $PEER_ID)

# print /ipns/<PEER_ID>
if [ "$OUTPUT4" == "/ipfs/$DIR_HASH" ] ; then
	OUTPUT5="/ipns/$PEER_ID"
	echo $OUTPUT5
	exit 0
   else
	echo "ERROR ..."
	exit 1
fi
