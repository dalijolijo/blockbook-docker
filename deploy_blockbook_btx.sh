#!/bin/bash
set -x
# variables
backend_deb="backend-bitcore_0.15.2.1-satoshilabs-1_amd64.deb"
blockbook_deb="blockbook-bitcore_0.3.1_amd64.deb"

apt-get update
apt-get install -y build-essential git docker.io

# Generate deb packages
if [ -f "$backend_deb" ] && [ -f "$blockbook_deb" ]; then
    echo "HINT: $backend_deb and $blockbook_deb exist. Skip generation."
    echo ""
    rm -rf ./blockbook
else 
    git clone https://github.com/trezor/blockbook
    cd blockbook
    make all-bitcore
    cp build/*.deb ..
    cd ..
    rm -rf ./blockbook
fi

# Build docker images
docker build -t btx-blockbook-docker .

