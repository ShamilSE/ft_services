#!/bin/bash

minikube delete
kubectl delete -f nginx/nginx.yaml
minikube delete

minikube start --vm-driver=virtualbox

minikube addons enable metallb

eval $(minikube docker-env)

docker build -t nginx-image nginx

kubectl apply -f nginx/nginx.yaml

