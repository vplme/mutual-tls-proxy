# mutual-tls-proxy
Very small nginx setup to test mutual TLS.

## Create certificates for nginx container
Setup Certificate Authority and nginx server certificate:
```
./setup-nginx-cert.sh
```

If you want a additional certificate for your client you can use:
```
./create-cert.sh 1 common-name
```

## Accessing nginx using client certificate
Create a client certificate using the `create-cert.sh` script:
```
./create-cert.sh 2 test-client 
```

Specify the client certificate and key. For example using `curl`:
```
curl --cert ./certs/test-client-cert.pem --key ./certs/test-client-key.pem -k https://localhost:9443
```

## Convert .pem files to PKCS12
```
openssl pkcs12 -export -inkey test-client-key.pem -in test-client-cert.pem -out cert_key.p12
```

## Import CA to JVM cacerts
```
keytool -importcert -trustcacerts -keystore $JAVA_HOME/lib/security/cacerts -file ca-cert.pem -alias dummyrootca
```