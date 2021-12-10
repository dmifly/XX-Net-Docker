# xxnet-docker

this is xx-net public server
normal run
docker run --restart=always -p 8085:8085 -p 8087:8087 -p 1080:1080 -d simoncheung/xxnet

use ipv6 in host
docker run --restart=always --net=host -d simoncheung/xxnet
