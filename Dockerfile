FROM ubuntu:latest

LABEL author="Pedro Guerrato"
LABEL e-mail="<pguerrato@gmail.com>"

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y vim software-properties-common
RUN apt-add-repository ppa:bitcoin/bitcoin
RUN apt-get update
RUN apt-get install -y bitcoind

RUN mkdir /root/.bitcoin
RUN touch /root/.bitcoin/bitcoin.conf
RUN echo prune=600 >> /root/.bitcoin/bitcoin.conf
RUN echo maxconnections=12 >> /root/.bitcoin/bitcoin.conf
RUN echo maxuploadtarget=20 >> /root/.bitcoin/bitcoin.conf
RUN echo rpcuser=user >> /root/.bitcoin/bitcoin.conf
RUN echo rpcpassword=password >> /root/.bitcoin/bitcoin.conf
RUN echo deamon=1 >> /root/.bitcoin/bitcoin.conf
RUN echo keypool=10000 >> /root/.bitcoin/bitcoin.conf
RUN echo disablewallet=0 >> /root/.bitcoin/bitcoin.conf
RUN echo printtoconsole=0 >> /root/.bitcoin/bitcoin.conf

CMD bitcoind

EXPOSE 8332 8333 18332 18333