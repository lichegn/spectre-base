FROM ubuntu:16.04
MAINTAINER HLXEasy <hlxeasy@gmail.com>

# Build parameters
ARG USERNAME="spectre"
ARG GROUPNAME="spectre"
ARG PASSWORD="spectre123"
ARG UID="1000"
ARG GID="1000"

# Setup spectre account
# Create working directory
# Change user UID and GID
RUN groupadd --gid ${GID} $GROUPNAME \
 && useradd --create-home --home-dir /home/$USERNAME --shell /bin/bash --uid ${UID} --gid ${GID} $USERNAME \
 && echo "$USERNAME:$PASSWORD" | chpasswd \
 && chown $USERNAME:$GROUPNAME /home/$USERNAME -R \
 && ulimit -v unlimited

RUN mkdir -p /home/$USERNAME/.spectrecoin/tor \
 && touch /home/$USERNAME/.spectrecoin/tor/torrc

RUN apt-get update -y \
 && apt-get upgrade -y

RUN apt-get install -y --no-install-recommends \
    ca-certificates \
    mc \
    libboost-chrono1.65.1 \
    libboost-filesystem1.65.1 \
    libboost-program-options1.65.1 \
    libboost-thread1.65.1 \
    libcap2 \
    libevent-2.1-6 \
    libqt5webchannel5 \
    libtool \
    libseccomp2 \
    qtwebengine5-dev \
    wget

# ============================================================================
# Newer OpenSSL version required!
RUN apt-get install -y --no-install-recommends \
    make

ENV OPENSSL_VERSION="1.1.0i"
RUN wget https://www.openssl.org/source/openssl-${OPENSSL_VERSION}.tar.gz \
 && tar xzvf openssl-${OPENSSL_VERSION}.tar.gz \
 && cd openssl-${OPENSSL_VERSION} \
 && ./config -Wl,--enable-new-dtags,-rpath,'$(LIBRPATH)' \
 && make \
 && make install \
 && cd -
 && rm -rf openssl-${OPENSSL_VERSION}.tar.gz \
 && rm -rf openssl-${OPENSSL_VERSION} \
# OpenSSL end
# ============================================================================

COPY spectrecoind.sh /usr/local/bin/spectrecoind.sh
RUN chmod +x /usr/local/bin/spectrecoind.sh

ENTRYPOINT ["/usr/local/bin/spectrecoind.sh"]
