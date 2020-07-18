# Custom Dockerfile for Daily Usage Container 

This repository is full of Dockefiles which helps you to perform day to day operation using containers.

### Image Management
Build Image
```
docker build -t <image:tag> .
```
List Images
```
docker images -a
docker images -f dangling=true
```
Remove Images
```
docker rmi <image>
docker images purge
docker images -a | grep "pattern" | awk '{print $3}' | xargs docker rmi
```
Remove Containers
```
docker ps -a  #List
docker rm $(docker ps -a -f status=exited -q)
```
Stop Container
```
docker stop $(docker ps -a -q)
```

One Shot
```
docker system prune
```