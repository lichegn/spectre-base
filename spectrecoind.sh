#!/bin/bash
# ============================================================================
#
# Simple spectrecoin entry script to start spectrecoind on Docker container
#
# Creation: 2018-07-29 hlxeasy
#
# ============================================================================

if [ -n "${RPCUSER}" ] ; then
    sed -i "s/rpcuser=.*$/rpcuser=${RPCUSER}/g" $HOME/.spectrecoin/spectrecoin.conf
fi
if [ -n "${RPCPASSWORD}" ] ; then
    sed -i "s/rpcpassword=.*$/rpcpassword=${RPCUSER}/g" $HOME/.spectrecoin/spectrecoin.conf
fi

/usr/local/bin/spectrecoind
