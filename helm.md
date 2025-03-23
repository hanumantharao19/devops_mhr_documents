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

 url "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  114  unzip awscliv2.zip
  115  aws --version
  116  vi /usr/bin/aws
  117  rm /usr/bin/aws
  118  rm -f /usr/bin/aws
  119  ls -lrt
  120  aws cli
  121  aws cli --version
  122  exit
  123  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  124  unzip awscliv2.zip
  125  sudo ./aws/install
  126  aws --version
  127  /usr/local/bin/aws --version
  128  sudo mv /usr/local/bin/aws /usr/bin/aws
  129  aws --version
 