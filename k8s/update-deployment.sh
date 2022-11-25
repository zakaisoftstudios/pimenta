#!/bin/bash
kubectl config set-context $(kubectl config current-context) --namespace=nextstep-${ENV}
# Update Volumes
kubectl apply -f ./k8s/${ENV}/volumes/es-volume.yml 
kubectl apply -f ./k8s/${ENV}/volumes/postgres-volume.yml
kubectl apply -f ./k8s/${ENV}/volumes/redis-volume.yml

# Update Apps
kubectl apply -f ./k8s/${ENV}/apps/es.yml
kubectl apply -f ./k8s/${ENV}/apps/postgres.yml
kubectl apply -f ./k8s/${ENV}/apps/redis.yml
kubectl apply -f ./k8s/${ENV}/apps/sidek.yml

# Update Services
kubectl apply -f ./k8s/${ENV}/services/es-service.yml
kubectl apply -f ./k8s/${ENV}/services/postgres-service.yml
kubectl apply -f ./k8s/${ENV}/services/redis-service.yml
kubectl apply -f ./k8s/${ENV}/service.yml

# Update Ingress
kubectl apply -f ./k8s/${ENV}/ingress.yml

# Update Secrets
kubectl apply -f ./k8s/${ENV}/secrets.yml

# Update deployment
kubectl apply -f ./k8s/${ENV}/deployment.yml