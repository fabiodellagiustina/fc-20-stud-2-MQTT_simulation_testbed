#!/bin/sh

kind create cluster  --config kind-cluster.yaml --name $USER
export KUBECONFIG="$(kind get kubeconfig-path --name=$USER)"
