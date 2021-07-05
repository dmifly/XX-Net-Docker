FROM alpine

ENV _XXNET_VERSION 4.5.3 
ENV CRYPTOGRAPHY_DONT_BUILD_RUST=1 TZ=Asia/Shanghai

WORKDIR /root/XX-Net-"$_XXNET_VERSION"
ADD  https://codeload.github.com/XX-net/XX-Net/zip/"$_XXNET_VERSION" /root
RUN unzip -q -d /root /root/"$_XXNET_VERSION" \
	&& apk --no-cache add gcc musl-dev libffi-dev openssl-dev openssl python3-dev py3-pip \
	&& pip install pyopenssl \
#	&& apk delete gcc musl-dev libffi-dev openssl-dev openssl python3-dev py3-pip \
	&& rm /root/"$_XXNET_VERSION" \
	&& rm -rf /var/cache/apk/* \
	&& ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& echo "Asia/Shanghai" > /etc/timezone \
	&& rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/ \
VOLUME /root/XX-Net-"$_XXNET_VERSION"/data/gae_proxy/
COPY config.json data/gae_proxy/config.json
EXPOSE 8087 8085 8086 1080
CMD ["/bin/sh","-c", "./start -allow_remote"]