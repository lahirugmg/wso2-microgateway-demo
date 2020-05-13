#!/bin/bash
set -x

hostname=$1
http_port=$2
https_port=$3
admin_http_port=$4
admin_https_port=$5
namespace=$6
deployment_name=$7
poc_artifacts_source=git-source

export PATH=$PATH:${bamboo_KUBCTLPATH}

# replace placeholders
sed -i "
s/{HOSTNAME}/$hostname/g
s/{HTTP_PORT}/$http_port/g
s/{HTTPS_PORT}/$https_port/g
s/{ADMIN_HTTPS_PORT}/$admin_https_port/g
s/{ADMIN_HTTP_PORT}/$admin_http_port/g
s/{NAMESPACE}/$namespace/g
s/{DEPLOYMENT_NAME}/$deployment_name/g
" $poc_artifacts_source/k8s-artifacts/wso2-am-admin/*.yaml

# deploy APIM in K8s
kubectl apply -f $poc_artifacts_source/k8s-artifacts/wso2-am-admin/
