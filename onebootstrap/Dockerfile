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

RUN chown oneadmin:oneadmin /docker-entrypoint.sh && chmod +x /docker-entrypoint.sh

# this is needed in order to create one_auth with correct uid and gid

# ENTRYPOINT ["/docker-entrypoint.sh"]

ENV DOCKERIZE_VERSION v0.5.0
RUN curl -fSL https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz -o /tmp/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf /tmp/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

USER oneadmin

CMD /usr/local/bin/dockerize -wait tcp://mysql:3306 -timeout 150s /docker-entrypoint.sh
