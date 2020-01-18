# blockbook-docker - Easy deployment of Trezor Blockbook for BTX

## Preperations
<details>
<summary>Checkout the repo blockbook-docker</summary>
<br>
  
```sh
git clone https://github.com/dalijolijo/blockbook-docker.git
cd blockbook-docker
git checkout master
```
</details>

<details>
<summary>Install docker.io and docker-compose v.3</summary>
<br>
  
```sh
./install_docker.sh
```
</details>

## For development

<details>
<summary>iBuild btx-blockbook-docker image</summary>
<br>

Execute the deployment script:
```sh
./deploy_blockbook_btx.sh
```
</details>

<details>
<summary>Start docker container</summary>
<br>

```sh
docker run --rm --name btx-blockbook-docker -p 9154:9154 -d btx-blockbook-docker:latest
```
</details>

<details>
<summary>Logging docker container</summary>
<br>

Find running blockbook docker container:
```sh
docker ps
```
Check logging:
```sh
docker logs -f btx-blockbook-docker 
```
</details>

<details>
<summary>Blockbook for BTX in your browser</summary>
<br>

Type in: ``https://<SERVER IP>:9154`` 
</details>

## For production 

<details>
<summary>Build btx-blockbook-docker image</summary>
<br>
  
Execute the deployment script:
```sh
./deploy_blockbook_btx.sh
```
</details>

<details>
<summary>Configuration</summary>
<br>
  
Replace ***example.com*** domain names in *data/nginx/conf_ssl.d/nginx.conf* folder and in *init-letsencrypt.sh* script with your domain name(s).
</details>

<details>
<summary>Run project for production environment with Certbot</summary>
<br>

You can get your SSL certificates from Let's Encrypt by running *init-letsencrypt.sh* script. 
```sh
./init-letsencrypt.sh
```

This script will also start your containers. 

In case you down your containers, you can restart them by following command:

```sh
docker-compose up -d
```
</details>

<details>
<summary>Logging docker containers</summary>
<br>

Check logs of docker containers:
```sh
docker-compose logs -f
```
</details>

<details>
<summary>Blockbook for BTX with SSL in your browser</summary>
<br>

Type in: ``https://<YOUR_DOMAIN_NAME>``
