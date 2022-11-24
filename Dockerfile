FROM python:3.11.0-alpine3.16

RUN apk update && apk upgrade && apk add python3

RUN pip install --upgrade pip && pip install radicale==2.1
RUN mkdir /etc/radicale && mkdir -p /var/db/radicale/collections
COPY config /etc/radicale/config

ENTRYPOINT [ "python3", "-m", "radicale", "--config" ]
CMD ["/etc/radicale/config"]
