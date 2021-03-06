#!/bin/bash

minikube delete # delete cluster
kubectl delete service <node-name>
kubectl delete deployment <node-name>

