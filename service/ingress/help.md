https://kubernetes.github.io/ingress-nginx/deploy/baremetal/


# TLS:
openssl genrsa -out tls.key 2048 
openssl req -new -x509 -key tls.key -out tls.cert -days 360 -subj /CN=example.com
kubectl create secret tls tls-secret --cert=tls.cert --key=tls.key
