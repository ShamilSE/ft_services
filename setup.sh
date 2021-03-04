#!/bin/bash
minikube start
kubectl create deployment new-node --image=image
kubectl expose deployment new-node --type=LoadBalancer --port=8080

