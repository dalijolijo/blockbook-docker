# blockbook-docker
Easy deployment of Trezor Blockbook for BTX

# Requirement
Clone this git repository:
```sh
git clone https://github.com/dalijolijo/blockbook-docker.git
```

# For development

## Installation
Execute the installation script:
```sh
./deploy_blockbook_btx.sh
```

## Start docker container
```sh
docker run --rm --name btx-blockbook-docker -p 9154:9154 -d btx-blockbook-docker:latest
```

## Logging docker container
Find running blockbook docker container:
```sh
docker ps
```
Check logging:
```sh
docker logs -f btx-blockbook-docker 
```

## Blockbook for BTX in your browser
Type in: ``https://<SERVER IP>:9154`` 


# For production 

## Installation
Docker Compose Installation: https://docs.docker.com/compose/install/
```sh
apt-get install docker-compose
```

## Build btx-blockbook-docker image (optional)
If no btx-blockbook-docker image is available on your server, execute the following script:
```sh
deploy_blockbook_btx.sh
```

## Configuration
Replace ***example.com*** domain names in *data/nginx/conf_ssl.d/nginx.conf* and *init-letsencrypt* folders with your domain name(s).

## Run project for production environment with Certbot
You can get your SSL certificates from Let's Encrypt by running *init-letsencrypt.sh* script. 
```sh
./init-letsencrypt.sh
```

This script will also start your containers. In case you down your containers, you can restart them by following command:

```sh
docker-compose -f docker-compose.prod.ssl up
```

## Logging docker containers
Check logs of docker containers:
```sh
docker-compose logs -f
```

## Blockbook for BTX in your browser
Type in: https://<YOUR_DOMAIN_NAME>
