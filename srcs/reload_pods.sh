#!/bin/bash

eval $(minikube docker-env)
kubectl delete -f nginx/nginx.yaml
docker build -t nginx-image nginx
kubectl apply -f nginx/nginx.yaml
