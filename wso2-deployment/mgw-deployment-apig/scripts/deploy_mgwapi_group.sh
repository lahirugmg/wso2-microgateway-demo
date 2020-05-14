#!/bin/bash
set -x

api_name=apig
project_name=demoapi
poc_artifacts_source=git-source
env=$1
deployment_pack=mgw-deployment-apig-1.0-SNAPSHOT
echo "[Microgateway Deployment] Starting deployment..."

# setting APICTL and KUBCTL paths
export PATH=$PATH:${bamboo_APICTLPATH}

rm -rf $deployment_pack
unzip $deployment_pack-default.zip
mv $deployment_pack/zips/* .
rm -rf $project_name

unzip $project_name.zip

# deploy the APIs with WSO2 MGW
if apictl get apis | grep -q $api_name; then
        echo "[Hilton Deployment] Updating api $api_name..."
        apictl update api --verbose -n $api_name --from-file=$project_name  --namespace wso2-$env
else
        echo "[Hilton Deployment] Creating api $api_name..."
        apictl add api --verbose --override -n $api_name --from-file=$project_name --namespace wso2-$env
fi


echo "[Hilton Deployment] Publishing APIs ... $api_name"

# import the API to the API portal
apictl login $env -u admin -p admin -k
apictl import-api -f $project_name -e $env -k --update
