# docker-logitechmediaserver
**Docker image for Logitech Media Server.**

CentOS based Docker container for the Logitech Media Server (SqueezeboxServer)

##Build
> docker build --tag="jtarlton/logitechmediaserver" .

## Run
Using data volumes for music files and configuration data.
```    
  docker run -i --rm \
  -p 9000:9000 -p 9090:9090 -p 3483:3483 -p 3483:3483/udp \
  --volumes-from music:ro --volumes-from lms-data:rw \
  -t jtarlton/logitechmediaserver
```
