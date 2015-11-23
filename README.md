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


