# docker-go-ipfs
Automated dockerhub build for Go [IPFS](http://ipfs.io)

### RUN
$ ./create-docker-network.sh <br>
$ ./build_local.sh <br>
$ ./run-ipfs-docker.sh ipfs-node 10.17.0.6<br>

### LOG
$ docker logs -f ipfs-node  

### TEST
$ docker exec -it 'ipfs-node' ipfs cat /ipfs/QmYwAPJzv5CZsnA625s3Xf2nemtYgPpHdWEz79ojWnPbdG/readme

### SHELL CONSOLE
$ docker exec -it 'ipfs-node' ipfs bash
