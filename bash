# Create a resource group
az group create --name voting-app-rg --location eastus

# Create Azure Container Registry (ACR)
az acr create --resource-group voting-app-rg --name myvotingacr --sku Basic

# Create AKS cluster
az aks create \
  --resource-group voting-app-rg \
  --name voting-aks-cluster \
  --node-count 2 \
  --enable-addons monitoring \
  --generate-ssh-keys

# Configure kubectl to connect to AKS
az aks get-credentials --resource-group voting-app-rg --name voting-aks-cluster

# Verify AKS cluster
kubectl get nodes
