#!/bin/bash

minikube stop
minikube delete

kubectl delete -f srcs/influxdb.yaml
kubectl delete -f srcs/nginx.yaml
kubectl delete -f srcs/mariadb.yaml
kubectl delete -f srcs/wordpress.yaml
kubectl delete -f srcs/phpmyadmin.yaml
kubectl delete -f srcs/ftps.yaml
kubectl delete -f srcs/grafana.yaml

minikube start --vm-driver=virtualbox --cpus=2 --disk-size="14000mb" --memory="4000mb"
minikube addons enable metallb
minikube addons enable metrics-server
minikube addons enable dashboard

eval $(minikube docker-env)
docker build -t influxdb srcs/influxdb/
docker build -t nginx_my srcs/nginx/
docker build -t mariadb srcs/mysql/
docker build -t wordpress srcs/wordpress/
docker build -t phpmyadmin srcs/phpmyadmin/
docker build -t ftps srcs/ftps/
docker build -t grafana srcs/grafana/

kubectl apply -f srcs/influxdb.yaml
kubectl apply -f srcs/metallb-config.yaml
kubectl apply -f srcs/nginx.yaml
kubectl apply -f srcs/mariadb.yaml
kubectl apply -f srcs/wordpress.yaml
kubectl apply -f srcs/phpmyadmin.yaml
kubectl apply -f srcs/ftps.yaml
kubectl apply -f srcs/grafana.yaml
