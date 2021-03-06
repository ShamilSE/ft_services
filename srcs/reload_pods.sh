#!/bin/bash

kubectl delete -f nginx/matallb/matallb.yaml

docker build -t nginx-image nginx

kubectl apply -f nginx/nginx.yaml
kubectl apply -f nginx/matallb/matallb.yaml
