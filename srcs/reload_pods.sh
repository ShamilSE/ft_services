#!/bin/bash

kubectl delete -f nginx/nginx.yaml
kubectl delete -f nginx/matallb/matallb.yaml
kubectl delete -f mysql/mysql.yaml
kubeclt delete -f wordpress/wordpress.yaml

#rm ~/.ssh/known_hosts

eval $(minikube docker-env)
docker build -t nginx-image nginx
docker build -t mysql-image mysql
docker build -t wordpress-image wordpress

kubectl apply -f nginx/nginx.yaml
kubectl apply -f nginx/matallb/matallb.yaml
kubectl apply -f mysql/mysql.yaml
kubectl apply -f wordpress/wordpress.yaml
