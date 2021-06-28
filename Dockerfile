FROM alpine

ENV _XXNET_VERSION 4.5.3
ENV CRYPTOGRAPHY_DONT_BUILD_RUST=1
WORKDIR /root/XX-Net-"$_XXNET_VERSION"
ADD  https://codeload.github.com/XX-net/XX-Net/zip/"$_XXNET_VERSION" /root
RUN unzip -q -d /root /root/"$_XXNET_VERSION" \
	&& apk --no-cache add gcc musl-dev libffi-dev openssl-dev openssl python3-dev py3-pip \
 	&& sed -i "s/allow_remote_connect\", 0/allow_remote_connect\", 1/" \
		code/default/launcher/config.py \
	&& rm /root/"$_XXNET_VERSION"
VOLUME /root/XX-Net-"$_XXNET_VERSION"/data/gae_proxy/
COPY client.json data/x_tunnel/client.json
COPY config.json data/gae_proxy/config.json
EXPOSE 8087 8085 8086 1080
CMD ["/bin/sh","-c", "./start"]
