#!/bin/bash
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')


url=$1
if [ -z "$url" ]
then
    #url="$(minikube ip):$INGRESS_PORT/customer"
    url="192.168.100.100:$INGRESS_PORT/customer"
fi

while true
do curl $url
sleep .5
done