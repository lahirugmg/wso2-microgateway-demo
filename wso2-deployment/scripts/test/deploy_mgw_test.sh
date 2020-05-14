#!/bin/bash
poc_artifacts_source=git-source

echo "Deploying to test environment"
./$poc_artifacts_source/wso2-deployment/mgw-deployment-apig/scripts/deploy_mgwapi_group.sh test
