#!/bin/bash

api_name=apig
env=$1
env_apim_url=$2 #https://wso2apim:32001
env_apim_token_url=$3 #https://wso2apim:32001/oauth2/token

echo "[Hilton Deployment] Initialize Environment ... $api_name"

# setting APICTL and KUBCTL paths
export PATH=$PATH:${bamboo_APICTLPATH}:${bamboo_KUBCTLPATH}

# add the API portal as an environment to the API controller
apictl add-env -e $env --apim $env_apim_url --token $env_apim_token_url

