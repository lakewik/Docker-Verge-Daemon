# Dockerfile for Verge
# http://vergecurrency.com/
# https://bitcointalk.org/index.php?topic=1365894
# https://github.com/vergecurrency/verge



FROM ubuntu:latest

MAINTAINER Jeremiah Buddenhagen <bitspill@bitspill.net>
RUN apt-get update && apt-get install -y sudo software-properties-common && rm -rf /var/lib/apt/lists/*

RUN sudo add-apt-repository ppa:bitcoin/bitcoin && apt-get update && sudo apt-get install libdb4.8-dev libdb4.8++-dev -y && apt-get install -y \
   libtool autotools-dev automake pkg-config libssl-dev zlib1g-dev libz-dev libevent-dev \
    bsdmainutils git libboost-all-dev libseccomp-dev libcap-dev libminiupnpc-dev libqt5gui5 \
    libqt5core5a libqt5webkit5-dev libqt5dbus5 qttools5-dev \
    qttools5-dev-tools libprotobuf-dev protobuf-compiler libqrencode-dev build-essential \
    git \
    libboost-all-dev \
    libdb-dev \
    libtool \
    autotools-dev \
    automake \
    pkg-config \
    libssl-dev \
    libevent-dev \
    bsdmainutils \
    git \
    libboost-all-dev \
    libminiupnpc-dev \
    libqt5gui5 \
    libqt5core5a \
    libqt5dbus5 \
    qttools5-dev \
    qttools5-dev-tools \
    libprotobuf-dev \
    protobuf-compiler \
    libqrencode-dev \
    libssl-dev

RUN git clone https://github.com/vergecurrency/verge /coin/git

WORKDIR /coin/git/src

RUN ./autogen.sh && ./configure && make

RUN mv VERGEd /coin/VERGEd && rm -rf /coin/git

WORKDIR /coin
VOLUME ["/coin/home"]

ENV HOME /coin/home

ENTRYPOINT ["/coin/VERGEdaemon"]
#CMD ["/coin/dogedaemon"]

# P2P, RPC
EXPOSE 21102 20102
