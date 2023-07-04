Create ec2 instance with t2 medium  and ubuntu 22.05 OS
Note: t2.medium is not in free tier
Install docker by following the below blog
https://linuxhint.com/install-docker-ubuntu-22-04/
Install minikube by following below link
https://www.linuxtechi.com/how-to-install-minikube-on-ubuntu/

Exexuted below all command with normal user

Docker installation
----------------
sudo apt update
sudo apt install -y ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
 sudo apt install docker-ce docker-ce-cli containerd.io -y
sudo usermod -aG docker $USER
newgrp docker




$sudo apt update -y
$sudo apt upgrade -y
$sudo Init 6
$sudo apt install -y curl wget apt-transport-https
$wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
$sudo cp minikube-linux-amd64 /usr/local/bin/minikube
$sudo chmod +x /usr/local/bin/minikube
$minikube version
$curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl


$chmod +x kubectl
$sudo mv kubectl /usr/local/bin/
$kubectl version -o yaml
$minikube start --driver=docker
$minikube start --addons=ingress --cpus=2 --cni=flannel --install-addons=true --kubernetes-version=stable --memory=3g
minikube status











