#!/usr/bin/env bash

serial=$1
common_name=$2

echo "Create key and certificate request for $common_name"
openssl req -newkey rsa:2048 -nodes \
   -subj "/C=NL/ST=Utrecht/L=Utrecht/O=Dummy Org/OU=Dummy Unit/CN=$common_name" \
   -addext "subjectAltName = DNS:localhost, DNS:127.0.0.1" \
   -keyout certs/$common_name-key.pem \
   -out certs/$common_name-req.pem

echo "Signing request and creating certificate for $common_name with serial $serial"
openssl x509 -req -days 365000 -set_serial $serial \
   -in certs/$common_name-req.pem \
   -out certs/$common_name-cert.pem \
   -CA certs/ca-cert.pem \
   -CAkey certs/ca-key.pem \
   -extfile san.cnf -extensions v3_req
