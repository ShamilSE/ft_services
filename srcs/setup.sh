#!/bin/bash

minikube delete
kubectl delete -f nginx/nginx.yaml
kubectl delete -f nginx/matallb/matallb.yaml

rm ~/.ssh/known_hosts

minikube start --vm-driver=virtualbox
minikube addons enable metallb

eval $(minikube docker-env)

docker build -t nginx-image nginx

kubectl apply -f nginx/nginx.yaml
kubectl apply -f nginx/matallb/matallb.yaml
open http://192.168.99.101
