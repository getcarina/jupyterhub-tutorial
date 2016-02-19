$ErrorActionPreference = "Stop";

## Environment variables you need set
# Set this to your publicly accessible IP address or DNS name
# export DNSNAME=jub.fict.io

# Comma-separated list of GitHub usernames to permit access
# $env:JUPYTERHUB_USERS=rgbkrk,smashwilson,carolynvs,everett-toews

# Populate these from a GitHub application that you've created.
# https://github.com/settings/applications/new
# $env:GITHUB_CLIENT_ID=
# $env:GITHUB_CLIENT_SECRET=

docker build -t jupyterhub-carina .
docker pull jupyter/singleuser

docker run --detach `
  --name jupyterhub `
  -p 80:8000 `
  -p 8081:8081 `
  --volumes-from swarm-data:ro `
  -e JUPYTERHUB_USERS=$env:JUPYTERHUB_USERS `
  -e JUPYTERHUB_ADMINS=$env:JUPYTERHUB_USERS `
  -e DOCKER_HOST=https://$($env:DOCKER_HOST.TrimStart("tcp://")) `
  -e HUB_IP_CONNECT=$env:DNSNAME `
  -e OAUTH_CALLBACK_URL=http://$($env:DNSNAME)/hub/oauth_callback `
  -e GITHUB_CLIENT_ID=$env:GITHUB_CLIENT_ID `
  -e GITHUB_CLIENT_SECRET=$env:GITHUB_CLIENT_SECRET `
  -e "constraint:node==*n1" `
  jupyterhub-carina

start http://$(docker port jupyterhub 8000)
