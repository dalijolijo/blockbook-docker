#!/bin/bash

# variables
backend_deb="backend-bitcore_0.15.2.1-satoshilabs-1_amd64.deb"
blockbook_deb="blockbook-bitcore_0.3.1_amd64.deb"

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

echo "Start docker container btx-blockbook-docker..."
docker run --rm --name btx-blockbook-docker -p 9154:9154 -d btx-blockbook-docker:latest

echo "Show log of docker container with: 'docker logs btx-blockbook-docker'"
