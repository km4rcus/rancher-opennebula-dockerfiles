ARG REPO=km4rcus
ARG TAG=v5.4-ubuntu
FROM ${REPO}/onebase:${TAG}
MAINTAINER Marco Mancini (marcomancini72@gmail.com)
LABEL Description="Image for OpenNebula onesched component" Version="0.1"

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

USER oneadmin

ENTRYPOINT ["/docker-entrypoint.sh"]
