#!/bin/bash
set -x

api_name=apig
project_name=demoapi
poc_artifacts_source=git-source

echo "[Hilton Deployment] Running deployment..."

# setting APICTL and KUBCTL paths
export PATH=$PATH:${bamboo_APICTLPATH}:${bamboo_KUBCTLPATH}

# apply APICTL config
apictl apply -f $poc_artifacts_source/k8s-artifacts/wso2-api-operator/controller_conf.yaml

# initialize the API project using the API definition file
apictl init -f $project_name --oas=api-definitions/mock-demo-api-def.yaml

# copy jar file built to libs
/bin/cp mgw-interceptors-*.jar $project_name/libs/interceptors.jar
/bin/cp /home/ubuntu/ssh/sample-api/libs/json-smart-1-1-1.jar $project_name/libs/jsonsmart.jar
/bin/cp /home/ubuntu/ssh/sample-api/libs/nimbus-jose-jwt-2-26-1.jar $project_name/libs/nimbusjosejwt.jar

zip -r $project_name.zip $project_name

mkdir $poc_artifacts_source/wso2-deployment/mgw-deployment-apig/resources
cp $project_name.zip $poc_artifacts_source/wso2-deployment/mgw-deployment-apig/resources
