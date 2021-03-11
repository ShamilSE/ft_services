#!/bin/bash

minikube stop
minikube delete

kubectl delete -f nginx/nginx.yaml
kubectl delete -f nginx/matallb/matallb.yaml
kubectl delete -f mysql/mysqlt.yaml

#rm ~/.ssh/known_hosts

minikube start --vm-driver=virtualbox
minikube addons enable metallb

eval $(minikube docker-env)
docker build -t nginx-image nginx
docker build -t mysql-image mysql

kubectl apply -f nginx/nginx.yaml
kubectl apply -f nginx/matallb/matallb.yaml
kubectl apply -f mysql/mysql.yaml
