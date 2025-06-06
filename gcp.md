
# GKE
- create and manage kubernetes cluster in GKE
- Deploy and manage containerized applications on GKE
- Use GKE features such as autoscaling,loadbalncing and logging
- intergrate GKE with other cloud platform services

Type of GKE cluster or mode of operation
 # Autopilot
 - Google can maintain infrastrcute
 - node configuration
 - autoscalling and auto updates
 - secuirty and networking
 # standarad cluster
  - Controll plan is managed by google
  - user configure individual nodes
  - user to manage the nodes
  - users can able to choose node type and node size
  - user need to manage autoscalling ,security configuration and upgades

# Types of cluster bases on regions
 # zonal cluster
  - Control Plane & Nodes: Both run in that single zone.
  - High Availability: Limited. If the zone goes down, the cluster is unavailable.
  - Development, testing
 # regional cluster
  -  Control Plane & Nodes: Control plane is replicated across zones for high availability; nodes run 
     in multiple zones.
  - High Availability: Higher. If one zone fails, the cluster continues to run in other zones.
  - Production, critical workloads

# create a Google Kubernetes Engine (GKE) cluster in several ways
- Google Cloud Console (Web UI)
- gcloud CLI (Command Line Interface)
- Terraform
- REST API / Client Libraries
  # Deployment Manager (Google Cloud Native IaC)
 ```
   - gcloud auth login
   - gcloud config set project YOUR_PROJECT_ID
   - gcloud config set compute/region us-central1
   - gcloud container clusters create my-regional-cluster --region us-central1 --num-nodes 3 --machine-type e2-medium
 ```
  # connect GKE cluster form laptop or VM
  - Make sure cloud installed
  ```
  gcloud auth login
  gcloud config set project <YOUR_PROJECT_ID>
  gcloud config set compute/region us-central1
  gcloud container clusters get-credentials <clustername> --region <cluster region>
  kubectl get nodes
  ```
  - if above command not wokring install below commands
  ```
   - gcloud components install kubectl
   - gcloud components install gke-gcloud-auth-plugin
  ```
# Node:
- A Node is a Virtual Machine (VM) in Google Cloud that runs your containerized applications (pods).
# Node Pool
- A Node Pool is a group of nodes (VMs) with the same settings (like machine type, OS).
- When you create a GKE cluster, one default node pool is created.
# Additional Node Pool
- You can add more node pools to the same cluster later.
- Each additional node pool can use different machine types or settings.
  - Use cases: You want one node pool for backend apps, and another for ML apps.
# Autoscaling
- Autoscaling means GKE will automatically increase or decrease the number of nodes in a node pool
  based on workload.
- You must set a minimum and maximum number of nodes
  - Example: If your app suddenly gets high traffic, GKE adds nodes. When traffic drops, it removes 
  extra nodes.
# Purpose of GKE cluster upgrde
- GKE upgrade is to keep your Kubernetes environment secure, stable, and up to date with new features 
  and bug fixes.
  # who is responsible for GKE standard cluster upgrade
  - We need to upgrade the control plane periodically — it's managed by Google, but we are responsible 
    for initiating the upgrade unless auto-upgrade is enabled.
  - It must be upgraded first before upgrading the node pools.
# Upgrade GKE Cluster using Command Line (gcloud)
  ##  Upgrade Control Plane (Master Node)
  ```
  gcloud container clusters upgrade CLUSTER_NAME \
  --master \
  --cluster-version=VERSION \
  --zone=region
  ```
  ##  Upgrade Node Pool
  ```
  gcloud container clusters upgrade CLUSTER_NAME \
  --node-pool=NODE_POOL_NAME \
  --cluster-version=VERSION \
  --zone=region
  ```
#  Upgrade GKE Cluster using Terraform
 - You do not need to manually upgrade using gcloud if your cluster is managed via Terraform.
   Just update the version in your Terraform config and re-apply it.
```
terraform init
terraform plan
terraform apply
```
# GKE Regional Cluster Upgrade – Under the Hood
- Control plane is replicated across 3 zones in a region (e.g., us-central1-a, us-central1-b, us- 
  central1-c).
- Highly available by default — designed for fault tolerance and zero-downtime upgrades.
  # Control Plane Upgrade
   - GKE upgrades one zone at a time, e.g.:us-central1-a → us-central1-b → us-central1-c.
   - Upgrade is done sequentially, one zone after the other.
   - This allows the Kubernetes API to stay available during the entire upgrade.
   - Kubernetes API server, controller manager, and scheduler are all updated per zone.
   ✅ Result: API is always reachable due to zone redundancy.
  #  Node Pool Upgrade
  - Rolling upgrade per zone, one node at a time.
  - Steps per node:
    Cordon → Drain → Delete VM → Create New VM → Rejoin cluster.
  - If surge upgrade is enabled:GKE temporarily creates extra VMs to speed up the process.
  # Add-On Components
  Optional GKE-managed system components (like kube-dns, calico, metrics-server) may also be upgraded.





