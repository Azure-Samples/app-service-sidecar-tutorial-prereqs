#!/bin/sh
set -e

# Make sure az commands use the same subscription
az account set -s $AZURE_SUBSCRIPTION_ID

printf "\nBuilding and uploading nginx image. Please wait..."
az acr build --resource-group $GROUP_NAME \
  --registry $ACR_NAME \
  --image nginx https://github.com/lcephas/template.git#main:images/nginx \
  --file Dockerfile \
  --platform linux \
  --no-logs \
  --output none
printf "Success!"

printf "Building and uploading otel-collector image. Please wait..."
az acr build --resource-group $GROUP_NAME \
  --registry $ACR_NAME \
  --image otel-collector https://github.com/lcephas/template.git#main:images/otel-collector \
  --file Dockerfile \
  --platform linux \
  --no-logs \
  --output none
printf "Success!\n"
