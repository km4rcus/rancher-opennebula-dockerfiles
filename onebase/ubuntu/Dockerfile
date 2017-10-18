ARG OS=ubuntu
ARG OS_VERS=16.04
FROM ${OS}:${OS_VERS}
MAINTAINER Marco Mancini (marcomancini72@gmail.com)
LABEL Description="OpenNebula Base Image 5.4 - Ubuntu 16.04 based" Version="0.1"

ARG ONE_VERSION=5.4
ARG ONE_REPO_OS=Ubuntu
ARG OS_VERS=16.04
RUN apt-get update && apt-get install -y wget apt-transport-https
RUN wget -q -O- http://downloads.opennebula.org/repo/repo.key | apt-key add -
RUN echo "deb https://downloads.opennebula.org/repo/${ONE_VERSION}/${ONE_REPO_OS}/${OS_VERS} stable opennebula" > /etc/apt/sources.list.d/opennebula.list

RUN apt-get update && apt-get install -y vim opennebula opennebula-sunstone opennebula-flow opennebula-gate

# /usr/share/install_gems is interactive
#
RUN sed -i.bak /usr/share/one/install_gems -e 's/option=STDIN.readline\[0,1\]/option="0"/;s/apt-get/apt-get -y/g' && \
grep -v "STDIN.readline" /usr/share/one/install_gems > /tmp/new_install_gems && \
mv /tmp/new_install_gems /usr/share/one/install_gems && \
chmod +x /usr/share/one/install_gems
#
# install thin 1.3.1 fails (in debian distribution)
# https://github.com/macournoyer/thin/issues/119#issuecomment-6990412
# with 1.3.1 that bug happens we should install as:
#      gem install thin -v '1.3.1' -- --with-cflags=\"-O2 -pipe -march=native -w\"
# or the version since 1.5.1 fixed the bug
#
# RUN sed -i -e 's/thin (1.3.1)/thin (1.5.1)/' /usr/share/one/Gemfile.lock
# Now we can run install_gems
#
RUN /usr/share/one/install_gems

# remove the configuration files / the password in order to create them at bootstrap
RUN rm -f /var/lib/one/.one/one_auth /etc/one/oned.conf /etc/one/sched.conf /etc/one/sunstone-server.conf \
    /etc/one/onegate-server.conf /etc/one/oneflow-server.conf /etc/one/econe-server.conf

# /etc/one will be shared as a named volume; backup to /opt/one to be copied at runtime
RUN mkdir -p /opt/one
RUN cp -r /etc/one /opt/one/etc
RUN rm -Rf /etc/one/*
