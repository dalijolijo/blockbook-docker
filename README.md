# blockbook-docker
Easy deployment of Trezor Blockbook for Bitcore in a docker container

## requirement
Install the following packages and clone this git repository:
```sh
apt-get install git docker
git clone https://github.com/dalijolijo/blockbook-docker.git
```

## easy deployment
Execute the install script:
```sh
./deploy_blockbook_btx.sh
```

## docker container logging
Find running blockbook docker container:
```sh
docker ps
```
Check logging:
```sh
docker logs -f btx-blockbook-docker 
```

## blockbook in your browser
Type in: ``https://<SERVER IP>:9154`` 

