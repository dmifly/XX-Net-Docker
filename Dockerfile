FROM alpine

ENV _XXNET_VERSION=4.7.8

WORKDIR /root/XX-Net-"$_XXNET_VERSION"
RUN wget -O /root/"$_XXNET_VERSION" https://codeload.github.com/XX-net/XX-Net/zip/"$_XXNET_VERSION" \
	&& unzip -q -d /root /root/"$_XXNET_VERSION" \
	&& rm /root/"$_XXNET_VERSION" \
	&& rm -rf /root/XX-Net-"$_XXNET_VERSION"/python* \
	&& apk --no-cache add py3-openssl \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf /var/cache/apk/* \
	&& rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/

EXPOSE 8087 8085 8086 1080
CMD ["/bin/sh","-c", "./start -allow_remote"]
