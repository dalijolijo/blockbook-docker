FROM debian:9

USER root

# Change sh to bash
SHELL ["/bin/bash", "-c"]

# Install packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y build-essential git wget pkg-config lxc-dev libzmq3-dev \
                       libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev \
                       liblz4-dev graphviz logrotate supervisor sudo && \
    apt-get clean

# Creating bitcore user
RUN adduser --disabled-password --gecos "" bitcore && \
    usermod -a -G sudo,bitcore bitcore

# Creating blockbook-bitcore user
RUN adduser --disabled-password --gecos "" blockbook-bitcore && \
    usermod -a -G sudo,blockbook-bitcore blockbook-bitcore

# Install backend-bitcore
ADD backend-bitcore_0.15.2.1-satoshilabs-1_amd64.deb .
RUN apt-get install -y ./backend-bitcore_0.15.2.1-satoshilabs-1_amd64.deb

# Install blockbook-bitcore
ADD blockbook-bitcore_0.3.1_amd64.deb .
RUN apt-get install -y ./blockbook-bitcore_0.3.1_amd64.deb

# Blockbook ports
#coin 	   blockbook internal port 	blockbook public port 	backend rpc port 	backend service ports (zmq)
#Bitcore   9054 	                9154 	                8054 	                38354
EXPOSE 9154 

COPY supervisord.conf /etc/supervisor/supervisord.conf
CMD ["/usr/bin/supervisord","-n","-c","/etc/supervisor/supervisord.conf"]
