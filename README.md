# docker-go-ipfs
Automated dockerhub build for Go [IPFS](http://ipfs.io)

### NETWORK
$ ./create-docker-network.sh 

### IMAGE
$ ./build_local.sh 

### RUN
$ ./run-ipfs-docker.sh ipfs-node 10.17.0.6<br>

### LOG
$ docker logs -f ipfs-node  

### TEST
#### Version
$ docker exec -it 'ipfs-node' ipfs version
#### Readme
$ docker exec -it 'ipfs-node' ipfs cat /ipfs/QmYwAPJzv5CZsnA625s3Xf2nemtYgPpHdWEz79ojWnPbdG/readme

### SHELL CONSOLE
$ docker exec -it 'ipfs-node' bash
