#!/bin/bash

kubectl delete -f nginx/nginx.yaml
kubectl delete -f nginx/matallb/matallb.yaml
kubeclt delete -f mysql/mysql.yaml

#rm ~/.ssh/known_hosts

eval $(minikube docker-env)
echo y | docker image prune
docker build -t nginx-image nginx
docker build -t mysql-image mysql

kubectl apply -f nginx/nginx.yaml
kubectl apply -f nginx/matallb/matallb.yaml
kubectl apply -f mysql/mysql.yaml
