ARG REPO=km4rcus
ARG TAG=v5.4-ubuntu
FROM ${REPO}/onebase:${TAG}
MAINTAINER Marco Mancini (marcomancini72@gmail.com)
LABEL Description="Image for OpenNebula Sunstone component" Version="0.1"

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# logging to stdout
RUN sed -i -e 's:SUNSTONE_LOG              = LOG_LOCATION + "/sunstone.log":SUNSTONE_LOG              = STDOUT:' /usr/lib/one/sunstone/sunstone-server.rb

USER oneadmin

EXPOSE 9869

ENTRYPOINT ["/docker-entrypoint.sh"]
