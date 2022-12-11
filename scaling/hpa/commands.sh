# Create hpa(same as applying hpa.yaml)
kubectl autoscale deployment php-apache --cpu-percent=50 --min=1 --max=10
# Create load 
kubectl run -i --tty load-generator --rm --image=busybox:1.28 --restart=Never -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://nginx-service; done"
