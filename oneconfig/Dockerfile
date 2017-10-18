ARG REPO=km4rcus
ARG TAG=v5.4-ubuntu
FROM ${REPO}/onebase:${TAG}
MAINTAINER Marco Mancini (marcomancini72@gmail.com)

RUN curl -L -o /usr/bin/confd https://github.com/kelseyhightower/confd/releases/download/v0.13.0/confd-0.13.0-linux-amd64 \
    && chmod +x /usr/bin/confd \
    && mkdir -p /etc/confd

COPY templates /etc/confd/templates/
COPY conf.d /etc/confd/conf.d/
COPY ./docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
