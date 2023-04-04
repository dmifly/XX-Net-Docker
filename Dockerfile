FROM alpine

ENV _XXNET_VERSION=5.1.1

WORKDIR /root/xxnet
RUN mkdir -p /root/xxnet \
	&& wget -c -O /root/xxnet.tar.gz https://codeload.github.com/XX-net/XX-Net/tar.gz/$_XXNET_VERSION \
	&& tar -xf /root/xxnet.tar.gz -C /root/xxnet --strip-components=1 \
	&& rm /root/xxnet.tar.gz \
	&& rm -rf /root/xxnet/python* \
	&& apk --no-cache add py3-openssl py3-brotli \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf /var/cache/apk/* \
	&& rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/

EXPOSE 8087 8085 8086 1080
CMD ["/bin/sh","-c", "./start -allow_remote"]