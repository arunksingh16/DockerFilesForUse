# Custom Dockerfile for Daily Usage Container 

Image provides following functionality
  
  - Chrome Driver
  - Gecko Driver
  - Chrome Browser
  - Firefox Browser
  - Kustomize

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