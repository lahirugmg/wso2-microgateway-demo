#!/bin/bash
poc_artifacts_source=git-source/poc-artifacts

echo "Deploying to staging environment"
./$poc_artifacts_source/wso2-deployment/mgw-deployment-apig1/scripts/deploy_mgwapi_group.sh staging
