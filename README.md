<p align="center">
<img style="align: center; padding-left: 10px; padding-right: 10px; padding-bottom: 10px;" width="238px" height="238px" src="logo.png" />
</p>

<h2 align="center">Infr - open infrastructure</h2>

[![Generic badge](https://img.shields.io/badge/LICENSE-GPLv3-orange.svg)](https://fmnx.io/infr/fmnx/src/branch/main/LICENSE)
[![Generic badge](https://img.shields.io/badge/GITEA-REPO-blue.svg)](https://fmnx.io/infr/fmnx)
[![Generic badge](https://img.shields.io/badge/GITHUB-REPO-red.svg)](https://github.com/fmnx-io/infr)
[![Build Status](https://ci.fmnx.io/api/badges/core/infr/status.svg)](https://ci.fmnx.io/core/infr)

This repo contains all code, related to infrastructure building for fmnx project. Only open-source and self-hosted have been used, and the way they customized is stored over here.

This repo contains following elements:

- Gitea with customized theme and parameters.
- Drone for ci and automation
- Uptime kuma for monitoring
- Mkdocs to provide perfect view of documentation
- Nginx as reverse proxy/load balancer
- Lego with script for certs updates
- Dozzle for checking logs in containers
- Repo for storing pacman packages

Most part of configurations are open and stored right in this repo, only private keys are hidden from public.
