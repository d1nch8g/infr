<p align="center">
<img style="align: center; padding-left: 10px; padding-right: 10px; padding-bottom: 10px;" width="238px" height="238px" src="logo.png" />
</p>

<h2 align="center">Infr - open infrastructure</h2>

[![Generic badge](https://img.shields.io/badge/license-gpl-orange.svg)](https://fmnx.su/infr/fmnx/src/branch/main/LICENSE)
[![Generic badge](https://img.shields.io/badge/fmnx-repo-006db0.svg)](https://fmnx.su/core/infr)
[![Generic badge](https://img.shields.io/badge/codeberg-repo-45a3fb.svg)](https://codeberg.org/fmnx/infr)
[![Generic badge](https://img.shields.io/badge/github-repo-red.svg)](https://github.com/fmnx-io/infr)
[![Generic badge](https://img.shields.io/badge/flaticon-icons-03fca1.svg)](https://www.flaticon.com)

This repository contains `docker-compose` files for fmnx insfrastructure, which consists of following elements:

- [Gitea](https://about.gitea.com/) with customized theme and parameters and API.
- [Postgres](https://www.postgresql.org/) for user data.
- [Minio](https://min.io/) for blobs, files, packages and LFS.
- [Docker mail](https://github.com/docker-mailserver/docker-mailserver) as gitea's mailer service.

Instructions for single-node local environment and multi-node public environment are provided below.

[Certbot-docker](https://hub.docker.com/r/certbot/certbot) and [go-lego](https://github.com/go-acme/lego) are used to obtain TLS certificates.

## Local setup

Local version has all containers in a single `docker-compose`. It can be used for local tests and UI adjustments.

1. Clone the repository.

```sh
git clone https://fmnx.su/core/infr
```

2. Run containers with `docker-compose`.

```sh
cd infr/local && docker compose up
```

## Single-node setup

If you are planning to setup gitea for your organization, team or household, you can route the domain name to your static IP adress, obtain certificates and run it, by following instructions:

1. Clone the repository.

```sh
git clone https://fmnx.su/core/infr && cd infr
```

2. Obtain certificates for gitea with [lego docker](https://hub.docker.com/r/goacme/lego/).

```sh
docker run --rm -it -p 80:80 -p 443:443 -w /wd -v $(pwd):/wd docker.io/goacme/lego --email="name@example.com" --domains="example.com" --http run
sudo chmod a+rwx -R .lego
```

3. Obtain certificates for email, add new user email accounts.

```sh
docker run --rm -it -v "$(pwd)/data/certbot/certs/:/etc/letsencrypt/" -v "$(pwd)/data/certbot/logs/:/var/log/letsencrypt/" -p 80:80 docker.io/certbot/certbot certonly --standalone -d mail.example.com
```

4. Create `.env` file with parameters for your project. Adjust them for your project.

```sh
echo APP_NAME=Awesome project >> .env
echo DOMAIN=example.com >> .env
echo MAIL_ADDR=help@example.com >> .env
echo MAIL_PASS=password >> .env
echo MINIO_ACCESS_KEY_ID=654321 >> .env
echo MINIO_SECRET_ACCESS_KEY=123456789 >> .env
echo POSTGRES_DB=db >> .env
echo POSTGRES_USER=user >> .env
echo POSTGRES_PASSWORD=password >> .env
```

5. Attach shell to `docker-email` container, add new users and obtain DKIM.

```sh
docker exec -it mail setup email add help@example.com password
docker exec -ti mail setup config dkim example.com
```

6. Restart setup with `docker-compose` for DKIM and email to start working properly.

```sh
docker compose down
docker compose up
```

---

## Multi-node setup

If you are planning to set up gitea for large collective or organization, it is reasonable to have multiple nodes. In this instruction, we assume that all nodes are located in the same network. Instruction consists of 5 parts: postgres, minio, mail, gitea and gitea-runner.

### 1. Postgres

1. SSH into postgres vm.

```sh
ssh user@vm
```

2. Clone infrastructure repo.

```sh
git clone https://fmnx.su/core/infr
```

3. Cd into postgres folder.

```sh
cd infr/postgres
```

4. Add postgres credentials to `.env` file. Save credentials to apply to gitea lates.

```sh
echo POSTGRES_USER=user >> .env
echo POSTGRES_PASSWORD=password >> .env
echo POSTGRES_DB=db >> .env
```

5. Start postgres with `docker-compose` and disconnect.

```sh
docker compose up
```

Verify, that postgres is up and running, by connecting with your client, i prefer [sqltools](https://open-vsx.org/extension/mtxr/sqltools) vscodium extension with postgres driver. Alternatively you can use [pgadmin](https://www.pgadmin.org/) or another postgres UI of your preference.

### 2. Minio

1. SSH into minio vm.

```sh
ssh user@vm
```

2. Clone infrastructure repository.

```sh
git clone https://fmnx.su/core/infr
```

3. Cd into minio folder.

```sh
cd infr/minio
```

4. Add minio credentials to `.env` file. Save credentials to apply to gitea lates.

```sh
echo MINIO_ACCESS_KEY=123456 >> .env
echo MINIO_SECRET_KEY=987654321 >> .env
```

5. Start minio with `docker-compose`.

```sh
docker compose up
```

### 3. Docker-email

1. SSH into email vm.

```sh
ssh user@vm
```

2. Clone infrastructure repository.

```sh
git clone https://fmnx.su/core/infr
```

3. Cd into email-server folder.

```sh
cd infr/mail
```

4. Obtain sertificates from letsencrypt. Before that you should ensure, that you have proper routing adjusted in your DNS server, and traffic from domain can reach the email VM. Script uses [letsencrypt](https://letsencrypt.org/) for obtaining TLS sertificates.

```sh
docker run --rm -it -v "$(pwd)/data/certbot/certs/:/etc/letsencrypt/" -v "$(pwd)/data/certbot/logs/:/var/log/letsencrypt/" -p 80:80 docker.io/certbot/certbot certonly --standalone -d mail.example.com
```

5. Attach shell to `docker-email` container, add new users and obtain DKIM.

```sh
docker exec -it mail setup email add help@example.com password
docker exec -ti mail setup config dkim example.com
```

6. Restart setup with `docker-compose` for DKIM and email to start working properly.

```sh
docker compose down
docker compose up
```

### 4. Gitea

1. SSH into gitea vm.

```sh
ssh user@vm
```

2. Clone infrastructure repository.

```sh
git clone https://fmnx.su/core/infr
```

3. Cd into gitea folder.

```sh
cd infr/gitea
```

4. Obtain certificates secure connection with [lego docker](https://hub.docker.com/r/goacme/lego/).

```sh
docker run --rm -it -p 80:80 -p 443:443 -w /wd -v $PWD:/wd docker.io/goacme/lego --email="name@example.com" --domains="example.com" --http run
sudo chmod a+rwx -R .lego
```

5. Add parameters for gitea, postgres, minio and mailer.

```sh
echo POSTGRES_HOST=postgres:5432 >> .env
echo POSTGRES_DB=db >> .env
echo POSTGRES_USER=user >> .env
echo POSTGRES_PASSWORD=password >> .env

echo DOMAIN=example.com >> .env

echo MAIL_ADDR=help@example.com >> .env
echo MAIL_PASS=12345 >> .env

echo MINIO_ENDPOINT=minio:9000 >> .env
echo MINIO_ACCESS_KEY_ID=123456 >> .env
echo MINIO_SECRET_ACCESS_KEY=987654321 >> .env
```

6. Run gitea with docker.

```sh
docker compose up
```
