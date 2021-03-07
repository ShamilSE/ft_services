#!/bin/bash

kubectl delete -f nginx/nginx.yaml
kubectl delete -f nginx/matallb/matallb.yaml

eval $(minikube docker-env)
docker build -t nginx-image nginx

kubectl apply -f nginx/nginx.yaml
kubectl apply -f nginx/matallb/matallb.yaml
open https://192.168.99.101
