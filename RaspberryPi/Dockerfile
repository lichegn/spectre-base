FROM desktopcontainers/raspberrypi
MAINTAINER HLXEasy <hlxeasy@gmail.com>

# Build parameters
ARG USERNAME="spectre"
ARG GROUPNAME="spectre"
ARG PASSWORD="spectre123"
ARG UID="1100"
ARG GID="1100"

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
    libboost-chrono1.62.0 \
    libboost-filesystem1.62.0 \
    libboost-program-options1.62.0 \
    libboost-thread1.62.0 \
    libevent-2.0-5 \
    libgles2-mesa \
    libqt5webchannel5 \
    libqt5webenginewidgets5 \
    libtool \
    libseccomp2 \
    wget

COPY spectrecoind.sh /usr/local/bin/spectrecoind.sh
RUN chmod +x /usr/local/bin/spectrecoind.sh

ENTRYPOINT ["/usr/local/bin/spectrecoind.sh"]
