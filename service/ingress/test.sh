# Add node IPs to /etc/hosts as 'example.com'
# From Ingress
http://example.com/1
http://example.com/2

# From NodePort
curl http://example.com:30210
curl http://example.com:30220
