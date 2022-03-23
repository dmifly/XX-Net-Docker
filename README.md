# xxnet-docker

this is xx-net public server

Standard docker run example

docker run --restart=always -p 8085:8085 -p 8087:8087 -p 1080:1080 -d simoncheung/xxnet

use ipv6 in host

docker run --restart=always --net=host -d simoncheung/xxnet

Source:
https://github.com/XX-net/XX-Net
