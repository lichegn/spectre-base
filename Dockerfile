FROM debian:stretch
MAINTAINER HLXEasy <hlxeasy@gmail.com>

# Build parameters
ARG BUILD_THREADS="1"
ARG USERNAME="spectre"
ARG GROUPNAME="spectre"
ARG PASSWORD="spectre123"
ARG UID="1000"
ARG GID="1000"

# Runtime parameters
ENV BUILD_THREADS=$BUILD_THREADS

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
    libevent-2.0-5 \
    libseccomp2 \
    build-essential \
    g++ \
    python-dev \
    autotools-dev \
    libicu-dev \
    libbz2-dev \
    wget

RUN wget -O boost_1_67_0.tar.gz http://sourceforge.net/projects/boost/files/boost/1.67.0/boost_1_67_0.tar.gz/download --no-check-certificate \
 && tar xzvf boost_1_67_0.tar.gz \
 && cd boost_1_67_0/ \
 && ./bootstrap.sh --prefix=/usr/local \
 && ./b2 --with-chrono --with-filesystem --with-program_options --with-thread -j ${BUILD_THREADS} install \
 && ldconfig
