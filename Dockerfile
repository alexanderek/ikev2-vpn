FROM alpine:3.10
LABEL maintainer="Alexander Kiselev <a@kslv.me>"

ENV HOST HOSTNAME

RUN apk add --no-cache \
    util-linux openssl strongswan bash \
    && rm -rf /var/cache/apk/* \
    && rm -f /etc/ipsec.secrets

ADD ./conf/* /etc/
ADD ./bin/* /usr/bin/

EXPOSE 500/udp 4500/udp

CMD /usr/bin/init
