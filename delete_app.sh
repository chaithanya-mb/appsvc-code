#!/bin/bash

# Variables
resourceGroup="BM-AZD-RG"

# 1. Delete Resource Group
az group delete --name $resourceGroup --yes --no-wait
