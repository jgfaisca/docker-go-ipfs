# docker-go-ipfs
Automated dockerhub build for Go [IPFS](http://ipfs.io)

### RUN
$ ./create-docker-network.sh
$ ./build_local.sh
$ ./run-ipfs-docker.sh go-ipfs

### LOG
$ docker logs -f go-ipfs  

### TEST
$ docker exec -it 'go-ipfs' ipfs cat /ipfs/QmYwAPJzv5CZsnA625s3Xf2nemtYgPpHdWEz79ojWnPbdG/readme
