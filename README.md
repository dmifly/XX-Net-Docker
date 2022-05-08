# How to Build
docker build -t xx-net github.com/dmifly/XX-Net-Docker

# How to Run
docker run --restart=always -p 8085:8085 -p 8087:8087 -p 1080:1080 -d xx-net

# How to Access Dashboard
http://<docker.ip>:8085

Source:
https://github.com/XX-net/XX-Net

Docker Hub:
https://hub.docker.com/r/simoncheung/xxnet

Github Container Registry:
https://github.com/dmifly/XX-Net-Docker/pkgs/container/xx-net
