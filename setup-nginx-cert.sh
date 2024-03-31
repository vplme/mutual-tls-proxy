#!/usr/bin/env bash
mkdir certs

echo "Creating Certificate Authority (CA) key"
openssl genrsa 2048 > certs/ca-key.pem

echo "Creating Certificate Authority (CA) self-signed certificate"
openssl req -new -x509 -nodes -days 365000 \
   -subj "/C=NL/ST=Utrecht/L=Utrecht/O=Dummy Org/OU=Dummy Unit/CN=Dummy Root CA" \
   -key certs/ca-key.pem \
   -out certs/ca-cert.pem

# Create certificate for Nginx
./create-cert.sh 01 server