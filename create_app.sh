#!/bin/bash

# Variables
resourceGroup="BM-AZD-RG"
location="centralindia"
appServicePlan="BM-AZD-Plan"
webAppName="bmazdwebapp$RANDOM"  # Must be globally unique
sku="B1"  # Pricing tier: F1, B1, S1, P1v2, etc.
runtime="dotnet:8"  # Change as needed (.NET, Java, Node, Python, etc.)

# 1. Create Resource Group
az group create --name $resourceGroup --location $location

# 2. Create App Service Plan
az appservice plan create \
  --name $appServicePlan \
  --resource-group $resourceGroup \
  --location $location \
  --sku $sku \
  # --is-linux  # Use this flag for Linux runtime

# 3. Create Web App
az webapp create \
  --name $webAppName \
  --resource-group $resourceGroup \
  --plan $appServicePlan \
  --runtime $runtime \
  --deployment-local-git

# 4. Output the Web App URL
echo "Your Web App is ready at: https://$webAppName.azurewebsites.net"
