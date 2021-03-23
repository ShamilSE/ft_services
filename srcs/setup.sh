#!/bin/bash

minikube stop
minikube delete

kubectl delete -f nginx/nginx.yaml
kubectl delete -f nginx/matallb/matallb.yaml
kubectl delete -f mysql/mysql.yaml
kubectl delete -f wordpress/wordpress.yaml
kubectl delete -f phpmyadmin/phpmyadmin.yaml

#rm ~/.ssh/known_hosts

minikube start --vm-driver=virtualbox --cpus=4 --memory=4096
minikube addons enable metallb
minikube addons enable dashboard

eval $(minikube docker-env)
docker build -t nginx-image nginx
docker build -t mysql-image mysql
docker build -t wordpress-image wordpress
docker build -t phpmyadmin-image phpmyadmin

kubectl apply -f nginx/nginx.yaml
kubectl apply -f nginx/matallb/matallb.yaml
kubectl apply -f mysql/mysql.yaml
kubectl apply -f wordpress/wordpress.yaml
kubectl apply -f phpmyadmin/phpmyadmin.yaml
