FROM alpine:latest

RUN apk update && apk upgrade && apk add python3

RUN /usr/bin/pip3 install --upgrade pip && /usr/bin/pip3 install radicale
RUN mkdir /etc/radicale && mkdir -p /var/db/radicale/collections
COPY config /etc/radicale/config

ENTRYPOINT [ "/usr/bin/python3", "-m", "radicale", "--config" ]
CMD ["/etc/radicale/config"]
