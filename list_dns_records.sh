#!/bin/bash

echo =========== Create an ubuntu pod ==================
kubectl run ubuntu1 --image=ubuntu -- bash -c "while true; do echo hello; sleep 10;done"

# Save a sorted list of IPs of all of the k8s SVCs:
kubectl get svc -A|egrep -v 'CLUSTER-IP|None'|awk '{print $4}'|sort -V > ips

# Copy the ip list to owr Ubuntu pod:
kubectl cp ips ubuntu1:/

echo =========== Installing dig tool into the pod ===============
kubectl exec -it ubuntu1 -- apt-get update
kubectl exec -it ubuntu1 -- apt install -y dnsutils

# Print 7 blank lines
yes '' | sed 7q
echo =========== Print all k8s SVC DNS records ====================
for ip in $(cat ips); do echo -n "$ip "; kubectl exec -it ubuntu1 -- dig -x $ip +short; done
echo ====== End of list =====================

echo ========= Cleanup  ===============
kubectl delete po ubuntu1
rm ips
exit 0
