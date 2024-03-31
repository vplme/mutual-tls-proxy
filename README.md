# mutual-tls-proxy
Very small nginx setup to test mutual TLS.

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