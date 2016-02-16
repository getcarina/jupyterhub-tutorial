#!/bin/sh
#
# Bash script to (non-interactively) create a self-signed TLS certificate.

openssl req -x509 -newkey rsa:2048 -days 365 -nodes -batch \
  -keyout private-key.pem \
  -out public-certificate.pem
