#!/bin/bash

# Variables
resourceGroup="BM-AZD-RG"
webAppName="bmazdwebapp$RANDOM"


# Capture Git deployment URL
gitUrl=$(az webapp deployment source config-local-git \
  --name $webAppName \
  --resource-group $resourceGroup \
  --query url --output tsv)


echo "Git deployment URL: $gitUrl"


git remote add azure "$gitUrl"
git push azure master

echo "✅ Your Application Deployment is completed!!!!"
echo "🌐 Visit your app: https://$webAppName.azurewebsites.net"
echo "🚀 Copy the Link & Paste it the Browser!!!!"