#!/bin/sh

kubectl apply -f mqttclient-deploy-press.yaml
kubectl apply -f mqttclient-deploy-temp.yaml

sleep 30

while true
do
	replicanumbpress=$(shuf -i 40-50 -n 1)
	replicanumbtemp=$(shuf -i 40-50 -n 1)
	kubectl scale deployment mqtt-client-deployment-pressure --replicas=$replicanumbpress
	kubectl scale deployment mqtt-client-deployment-temperature --replicas=$replicanumbtemp
	echo "Pressure replicas= $replicanumbpress"
	echo "Temperature replicas= $replicanumbtemp"
	sleep 30
done
