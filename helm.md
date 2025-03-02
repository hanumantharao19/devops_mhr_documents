## Steps to helm in ubuntu server
```
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
sudo apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm
```
- or
## heml install
```
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```
## helm commands
 - helm create sampleapp
 - helm install sampleapp-release sampleapp
 - helm list -a
 - helm uninstall <releasename>
 - helm upgrade <release name > <chartnmae>
 - helm rollback <releasename>  <revision version>
 - helm install <rleasename> --dry-run --debug <chartname>
 - Helm template <chartname>
 - helm lint <Chart name>
 - helm search hub <helmchartname>

 - https://artifacthub.io/ # helm chart available in this site
 





   26  helm list -a
   27  kubectl get service
   28  kubectl get pods -o wide
 