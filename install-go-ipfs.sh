#!/bin/bash
#
# Install Go IPFS
#


IPFS_VERSION=v0.4.18

# -- Install dependencies --
sudo apt-get update && sudo apt-get install -y curl

# -- Install IPFS ---
curl -O https://dist.ipfs.io/go-ipfs/${IPFS_VERSION}/go-ipfs_${IPFS_VERSION}_linux-amd64.tar.gz \
	&& tar xvzf go-ipfs_${IPFS_VERSION}_linux-amd64.tar.gz \
	&& mv go-ipfs/ipfs /usr/local/bin/ipfs \
	&& rm -rf go-ipfs \
	&& rm -f go-ipfs_${IPFS_VERSION}_linux-amd64.tar.gz
