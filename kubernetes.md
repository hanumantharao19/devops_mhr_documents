Docker swam
------------
it is used to connect mutiple containers together and increse
containers count  and deploy the contaienr into mutiple work nodes

kubernetes
------------
kubernetes cluster is creating in mutiple ways

1) minikube  --> this we can install in you laptop or in VM
2) kubeadm ---> this clusater can require mutiple VM (minimun 3 VM) these 
VM many in AWS ,GCP,Azure and onPrime


EKS( elastic Kubernetes server) --> this can provide by AWS
GKE(google kubernetes Enginee) ---> this can be provide by Google
AKS ( Azure Kubernernetes service)  --> this can be provided by Azure

minikube:
------------
Create ec2 instance with t2 medium  and ubuntu 22.05 OS
Note: t2.medium is not in free tier

Install docker by following the below blog
https://linuxhint.com/install-docker-ubuntu-22-04/
Install minikube by following below link
https://www.linuxtechi.com/how-to-install-minikube-on-ubuntu


sudo apt update
sudo apt install -y ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt install docker-ce docker-ce-cli containerd.io -y
sudo usermod -aG docker $USER
newgrp docker



Install Minikube:
------------
Step 1) isntall minikube
----------------------

sudo apt update -y
sudo apt upgrade -y
sudo Init 6
sudo apt install -y curl wget apt-transport-https
wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo cp minikube-linux-amd64 /usr/local/bin/minikube
sudo chmod +x /usr/local/bin/minikube
sudo chmod +x /usr/local/bin/minikube
minikube version

step2)Isntall kubectl command line tools
--------------------------

sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
kubectl version -o yaml

Start the minikube
------------
minikube start --driver=docker
minikube start --addons=ingress --cpus=2 --cni=flannel --install-addons=true --kubernetes-version=stable --memory=3g
minikube status


Deploy the sample application in Kubernetes(minikube)
--------------------------
kubectl create deployment my-nginx --image=nginx
kubectl get deployments.apps my-nginx
kubectl get pods



Deploy the pod in kubernetes cluster
------------------------------------
kubectl run hanu  --image nginx  --> create the pod in command line

or

pod.yaml
----------
apiVersion: v1

kind: Pod

metadata:

  name: mhr

spec:

  containers:

  - name: mhr

    image: nginx:1.14.2

    ports:

    - containerPort: 80

-----------------------

kubectl create -f pod.yaml  --> to create through manifest file

kubectl delete pod hanu  ---> to delete the pod
or
kubectl delete -f pod.yaml  --> to delete the pod

Namespace:

name space is noting but a virtual cluster

Genrall a cluster can divided into number of namespaces as 
per our requirement

by default we have some namespaces in the cluster


kubectl get namespaces  --> to list the namespaces

or 
kubectl get ns ---> --> to list the namespaces

kubectl get pods --> to list pods in default namespaces
or
kubectl get po  -->to list pods in default namespaces


Replicaset
-------------
Replicaset is used to  maintain or running always  same number of pods  as mentioned 
in the manifest file
-------
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: my-replicaset
spec:
  replicas: 2
  selector:
    matchLabels:
      app: my-app
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
      - name: my-container
        image: nginx
---------------------------

kubectl get replicaset  --> to list the replicaset

or
kubectl get rs  --> to list the replicaset


kubectl delete rs <replicasetname>  -->   to delete the replicaset


kubernetes Deployment :
------------------
kubernetes deployment has some advantages as compared to Replicaset
1) we can increase the pod and decrease the pod count through commnad line
2) we rollout and rollback the version easly with deployment

rollout: we can deploy the new version code


rollback: we can revert deployment to old the version 

update the docker iamge in command line

kubectl set image deployment.v1.apps/mhr-deployement mhr-container=nginx:1.16.1

apiVersion: apps/v1
kind: Deployment
metadata:
  name: vamsi-deployement
spec:
  replicas: 1
  selector:
    matchLabels:
      app: sales-app
  template:
    metadata:
      labels:
        app: sales-app
    spec:
      containers:
      - name: mhr-container
        image: nginx

-------------------
-----------------
how to create namespace


kubectl create  namespace <namespacename>

Ex: kubectl create namespace dev  --> create the dev namespace

or 
kubectl create -f namespace.yaml --Create the the namespace


kubectl delete namespace dev --- delete the dev namespace

or 
kubectl delete -f namespace


kubectl create -f deployment.yaml  ---> inside we can namespace details 
to deployment particualar namespace

or

kubectl create -f deployment.yaml -n dev  --> deployemt pods in to the dev
namespace


apiVersion: apps/v1
kind: Deployment
metadata:
  name: vamsi-deployement
  namesapce: dev
spec:
  replicas: 1
  selector:
    matchLabels:
      app: sales-app
  template:
    metadata:
      labels:
        app: sales-app
    spec:
      containers:
      - name: mhr-container
        image: nginx


kubectl get pods -n dev ---> list the all pods in the dev namespace

----------------------
configmaps
---------

configmap.yaml

apiVersion: v1
kind: ConfigMap
metadata:
  name: mhr-config
data:
  application.properties: |
    enemies=name
    lives=34578
    enemies.cheat=true
    enemies.cheat.level=noGoodRotten
    secret.code.passphrase=UUDDLRLRBABAS
    secret.code.allowed=true
    secret.code.lives=30

kubectl create -f configmap.yaml -->crete configmap

or 

kubectl create configmap hanu-config --from-file=hanu.properties --Create 
configmap by command line

--------------
apiVersion: apps/v1
kind: Deployment
metadata:
  name: sales-config-deployement
spec:
  replicas: 2
  selector:
    matchLabels:
      app: sales-app
  template:
    metadata:
      labels:
        app: sales-app
    spec:
      containers:
      - name: mhr-container
        image: nginx
        env:
         - name: myname
           valueFrom:
            configMapKeyRef:
              name: mhr-var-config
              key: NAME
         - name: myinitial
           valueFrom:
            configMapKeyRef:
              name: mhr-var-config
              key: INITIAL
        volumeMounts:
         - name: mhr-volume
           mountPath: /etc/hanu
      volumes:
       - name: mhr-volume
         configMap:
           name: mhr-config
-----------------------------
Persistant volume
-----------------
apiVersion: v1
kind: PersistentVolume
metadata:
  name: mhr-pv
spec:
  storageClassName: manual
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: /home/ubuntu/mhr

-----
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: mhr-pvc
spec:
  storageClassName: manual
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
-------------------
apiVersion: v1
kind: Pod
metadata:
  name: mhr-nginx
spec:
  volumes:
    - name: mhr-storage
      persistentVolumeClaim:
        claimName: mhr-pvc
  containers:
    - name: nginx-container
      image: nginx
      ports:
        - containerPort: 80
          name: "http-server"
      volumeMounts:
        - mountPath: /home/nginx/mhr
          name: mhr-storage
-------------------













