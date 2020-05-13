#!/bin/bash
poc_artifacts_source=git-source

echo "Deploying APIM Admin to test environment"

set -x

./$poc_artifacts_source/wso2-deployment/am-deployment-admin/scripts/deploy_apim_admin.sh wso2apimtest 32004 32003 32002 32001 wso2-test wso2apim
