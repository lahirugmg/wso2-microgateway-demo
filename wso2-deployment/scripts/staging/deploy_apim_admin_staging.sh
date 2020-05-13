#!/bin/bash
poc_artifacts_source=git-source
echo "Deploying APIM Admin to staging environment"

set -x

./$poc_artifacts_source/scripts/deploy_apim_admin.sh wso2apimstaging 32104 32103 32102 32101 wso2-staging wso2apim
