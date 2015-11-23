# HW4
## FILE IO
* Create a droplet on digital ocean and ssh into that droplet
* Then run the following commands to install docker
```
sudo apt-get update
curl -sSL https://get.docker.com/ | sh
```
* Create a Dockerfile 
* Run the following command to build Docker image
```
sudo docker build -t myimage .
```
* Create the 'server' container which exposes the file on port 9001 by running the following command
```
docker run -d --name server myimage socat tcp-l:9001,reuseaddr,fork system:'cat abc.txt',nofork
```
* Create the linked 'client' container by running the following command
```
docker run -it -d --name client -h client --link server:server myimage
```
* Then open a terminal in the running client container by running the following command
```
docker exec -it 47c103244b6b /bin/bash
```
* Type the following in the terminal
```
curl server:9001
```
### Screencast for Part 1
![screencast for part1](https://cloud.githubusercontent.com/assets/11006675/11339893/9b3c60da-91c9-11e5-8872-caebb5c76819.gif)

## Ambassador Pattern 
* Create two digital ocean droplets and ssh into those droplets. Name the droplets as 'Server' and 'Client'
* Run the following commands to install docker and docker-compose
```
curl -sSL https://get.docker.com/ | sh
curl -L https://github.com/docker/compose/releases/download/1.5.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```
* Create separate docker-compose.yml files on both client and server respectively
* On the server droplet run the following command:
```
docker-compose up
```
* On the client droplet run the following command to open the redis-cli:
```
docker run -i -t --rm --link redis-ambassador:redis relateiq/redis-cli
```
* On the redis-cli
```
redis 172.17.0.2:6379> PING
PONG
redis 172.17.0.2:6379> set myKeyValue "Hello"
OK
redis 172.17.0.2:6379> get myKeyValue
"Hello"
redis 172.17.0.2:6379> 
```


