#!/bin/bash
set -x
# variables
backend_deb="backend-bitcloud_2.1.0.1-satoshilabs-1_amd64.deb"
blockbook_deb="blockbook-bitcloud_0.3.1_amd64.deb"

apt-get update
apt-get install -y build-essential git

# Generate deb packages
if [ -f "$backend_deb" ] && [ -f "$blockbook_deb" ]; then
    echo "HINT: $backend_deb and $blockbook_deb exist. Skip generation."
    echo ""
    rm -rf ./blockbook
else 
    #git clone https://github.com/trezor/blockbook
    git clone https://github.com/dalijolijo/blockbook
    cd blockbook
    git checkout btdx #only needed before merge
    make all-bitcloud
    cp build/*.deb ..
    cd ..
    rm -rf ./blockbook
fi

# Build docker images
docker build -t btdx-blockbook-docker:latest .
docker tag btdx-blockbook-docker:latest webapp
