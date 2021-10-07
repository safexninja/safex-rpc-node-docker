FROM ubuntu:18.04

ENV VERSION=7.0.2

RUN apt-get update -y && \
    apt-get install -y \
    sudo \
    wget \
    libzmq3-dev \
    libpcsclite-dev 

ARG USER=docker
ENV HOME /home/$USER

RUN adduser --disabled-password --gecos '' $USER
RUN adduser $USER sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER docker

USER $USER
WORKDIR $HOME
 
RUN  sudo mkdir /data

RUN wget https://github.com/safex/safexcore/releases/download/$VERSION/safexd-linux-$VERSION
RUN chmod +x safexd-linux-$VERSION

EXPOSE 17400-17403/tcp

LABEL author="Safex.Ninja"
LABEL core-version=$VERSION
LABEL description="Running Safex Core Node"
LABEL info="See https://github.com/safex/safexcore/"

CMD sudo ./safexd-linux-$VERSION --rpc-bind-ip $RPC_IP --in-peers=50 --out-peers=50 --data-dir=/data --confirm-external-bind --restricted-rpc 

