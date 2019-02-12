# version 1.1 

FROM ubuntu:latest

MAINTAINER Jose G. Faisca <jose.faisca@gmail.com>

# -- IPFS variables -- 
ENV IMAGE demo/go-ipfs
ENV IPFS_VERSION v0.4.18
ENV IPFS_PATH /data/ipfs
ENV IPFS_LOGGING ""

# -- Terminal variable --
ENV TERM xterm

# -- Install dependencies --
RUN apt-get update && apt-get install -y curl 

# -- Install IPFS ---
RUN curl -O https://dist.ipfs.io/go-ipfs/${IPFS_VERSION}/go-ipfs_${IPFS_VERSION}_linux-amd64.tar.gz \
	&& tar xvzf go-ipfs_${IPFS_VERSION}_linux-amd64.tar.gz \
	&& mv go-ipfs/ipfs /usr/local/bin/ipfs \
	&& rm -rf go-ipfs \
	&& rm -f go-ipfs_${IPFS_VERSION}_linux-amd64.tar.gz \
	&& mkdir -p $IPFS_PATH
	
# -- Clean --
RUN cd / \
        && apt-get autoremove -y \
        && apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#  -- Ports for Swarm TCP, Swarm uTP, API, Gateway ---
EXPOSE 4001/tcp 4002/udp 5001/tcp 8080/tcp

VOLUME $IPFS_PATH

COPY run.sh /usr/local/bin
ENTRYPOINT ["run.sh"]

CMD ["ipfs", "daemon" ]
