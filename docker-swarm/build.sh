#!/bin/bash

micro-gw init demo

cp api-definitions/mock-demo-api-def.yaml demo/api_definitions/

cp interceptors/target/mgw-interceptors-1.0-SNAPSHOT.jar demo/lib/

micro-gw build demo --docker-image demo:v1 --docker-base-image wso2/wso2micro-gw:latest

