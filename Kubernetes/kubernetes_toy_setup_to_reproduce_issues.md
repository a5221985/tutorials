# Kubernetes Toy Setup to Reproduce Issues #

## 
az group create --name myResourceGroup --location eastus

az aks create --resource-group myResourceGroup --name myAKSCluster --node-vm-size Standard_DS1_v2 --node-count 1 --vm-set-type VirtualMachineScaleSets --load-balancer-sku standard --enable-cluster-autoscaler --min-count 1 --max-count 3

https://docs.microsoft.com/en-us/cli/azure/aks?view=azure-cli-latest#az_aks_create
https://docs.microsoft.com/en-us/azure/virtual-machines/dv2-dsv2-series

vi Dockerfile

FROM php-5-apache
COPY index.php /var/www/index.php
RUN chmod a+rx index.php

vi index.php

<?php
  $x = 0.0001;
  for ($i = 0; $i <= 1000000; $i++) {
    $x += sqrt($x);
  }
  echo "OK!";
?>


vi php-apache.yml

apiVersion: apps/v1
kind: Deployment
metadata:
    name: php-apache
spec:
    selector:
        matchLabels:
            run: php-apache
    replicas: 1
    template:
        metadata:
            labels:
                run: php-apache
        spec:
            containers:
                - name: php-apache
                  image: k8s.gcr.io/hpa-example
                  ports:
                      - containerPort: 80
                  resources:
                      limits:
                          cpu: 500m
                          memory: 128Mi
                      requests:
                          cpu: 200m
                          memory: 64Mi
---
apiVersion: v1
kind: Service
metadata:
    name: php-apache
    labels:
        run: php-apache
spec:
    ports:
        - port: 80
    selector:
        run: php-apache
        

kubectl apply -f php-apache.yaml
kubectl get all
kubectl get nodes

kubectl autoscale deployment php-apache --cpu-percent=50 --min=1 --max=10

kubectl get hpa

kubectl run -i --tty load-generator --rm --image=busybox --restart=Never -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://php-apache; done"

kubectl get hpa

kubectl get deployment php-apache

## Stop Load ##
1. Hit `Ctrl` + `C`

		kubectl get deployment php-apache