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

# Creating bitcloud user
RUN adduser --disabled-password --gecos "" bitcloud && \
    usermod -a -G sudo,bitcloud bitcloud

# Creating blockbook-bitcloud user
RUN adduser --disabled-password --gecos "" blockbook-bitcloud && \
    usermod -a -G sudo,blockbook-bitcloud blockbook-bitcloud

# Install backend-bitcloud
ADD backend-bitcloud_2.1.0.1-satoshilabs-1_amd64.deb .
RUN apt-get install -y ./backend-bitcloud_2.1.0.1-satoshilabs-1_amd64.deb

# Install blockbook-bitcloud
ADD blockbook-bitcloud_0.3.1_amd64.deb .
RUN apt-get install -y ./blockbook-bitcloud_0.3.1_amd64.deb

# Blockbook ports
#coin 	   blockbook internal port 	blockbook public port 	backend rpc port 	backend service ports (zmq)
#Bitcloud  9062                     9162                    8062                38362 
EXPOSE 9162

COPY supervisord.conf /etc/supervisor/supervisord.conf
CMD ["/usr/bin/supervisord","-n","-c","/etc/supervisor/supervisord.conf"]
