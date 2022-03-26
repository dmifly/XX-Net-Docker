XX-Net Docker Version

# How to Build Your Own Docker
docker build -t xx-net github.com/dmifly/XX-Net-Docker

# How to Run Docker via Local Image
docker run --restart=always -p 8085:8085 -p 8087:8087 -p 1080:1080 -d xx-net

# How to Pull & Run XX-Net via Docker Hub Public Image
docker run --restart=always -p 8085:8085 -p 8087:8087 -p 1080:1080 -d simoncheung/xxnet

# How to Pull & Run XX-Net via GitHub Public Image

docker run --restart=always -p 8085:8085 -p 8087:8087 -p 1080:1080 -d ghcr.io/dmifly/xx-net

Source:
https://github.com/XX-net/XX-Net

Docker Hub:
https://hub.docker.com/r/simoncheung/xxnet

Github Container Registry:
https://github.com/dmifly/XX-Net-Docker/pkgs/container/xx-net
