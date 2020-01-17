# blockbook-docker
Easy deployment of Trezor Blockbook for Bitcore in a docker container

## requirement
Clone this git repository:
```sh
git clone https://github.com/dalijolijo/blockbook-docker.git
```

# For development
Execute the installation script:
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


# For production 

## Installation
Docker Compose Installation: https://docs.docker.com/compose/install/
```sh
apt-get install docker-compose
```

## Configurations
Replace ***example.com*** domain names in *data/nginx/conf_ssl.d/nginx.conf* and *init-letsencrypt* folders with your domain name(s).

## Run project for production environment with Certbot
You can get your SSL certificates from Let's Encrypt by running *init-letsencrypt.sh* script. 
First make the script executable by command below,
```sh
chmod u+x init-letsencrypt.sh 
```

Then run the script,

```sh
./init-letsencrypt.sh
```

This script will also start your containers. In case you down your containers, you can restart them by following command,

```sh
docker-compose -f docker-compose.prod.ssl up
```
