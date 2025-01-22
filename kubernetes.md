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

- EKS( elastic Kubernetes server) --> this can provide by AWS
- GKE(google kubernetes Enginee) ---> this can be provide by Google
- AKS ( Azure Kubernernetes service)  --> this can be provided by Azure
## follow below steps to create EKS cluster manually in aws
Step1) a) Select trusted entity type is AWS Service and select use case is EKS cluster
        b) assign AmazonEKSclusterPolicy to the role while creating the rule
Step2) a)while create EKS cluster assign the above role and select VPC and subnets
       b)select cluster end point access( in our case select public)
Step3) Enable logging if we want
Step4) if we want to add Amazon  Eks add-ons then we can add other wise no need
Step5) change Eks add-ons settings like version and others
Step6) review and create the cluster


Step1)
 a)Create rule for the EKS node group
 b) while create node role select use case is EC2 instance only 
c) Add the below policies while creating the role
AmazonEKSWorkerNodePolicy,
 AmazonEKS_CNI_Policy,
Amazon container registry read only policy
Step2) a) select Ami type , instance type and disk size 
            b) node group scaling configurations
Step3) select the subnet where we need  to create nodes

minikube:
------------
Create ec2 instance with t2 medium  and ubuntu 22.05 OS
Note: t2.medium is not in free tier

Install docker by following the below blog
https://linuxhint.com/install-docker-ubuntu-22-04/
Install minikube by following below link
https://www.linuxtechi.com/how-to-install-minikube-on-ubuntu


- sudo apt update
- sudo apt install -y ca-certificates curl gnupg lsb-release
- curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker- 
  archive-keyring.gpg
- echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] 
  https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee 
  /etc/apt/sources.list.d/docker.list > /dev/null
- sudo apt-get update
- sudo apt install docker-ce docker-ce-cli containerd.io -y
- sudo usermod -aG docker $USER
- newgrp docker
Install Minikube:
------------
Step 1) isntall minikube
----------------------

- sudo apt update -y
- sudo apt upgrade -y
- sudo Init 6
- sudo apt install -y curl wget apt-transport-https
- wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
- sudo cp minikube-linux-amd64 /usr/local/bin/minikube
- udo chmod +x /usr/local/bin/minikube
- sudo chmod +x /usr/local/bin/minikube
- minikube version

step2)Isntall kubectl command line tools
--------------------------

- sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
- chmod +x kubectl
- sudo mv kubectl /usr/local/bin/
- kubectl version -o yaml

Start the minikube
------------
- minikube start --driver=docker
- minikube start --addons=ingress --cpus=2 --cni=flannel --install-addons=true --kubernetes-version=stable --memory=3g
- minikube status

## To know cluster events and cluster info
 - kubectl get events
 - kubectl config view
################################
# create EKS Cluster Using EKSCTL and connect on linux machine
## prerequisites
- Frist we need to create a linux server in aws and crete user in aws and provide admin access
  to that user. create aws access key and secret keys for that user 
## step1) Install aws cli in linux
```
sudo dnf install python3-pip
pip3 install awscli --upgrade --user
aws --version
```
## step2) Configure Aws credentials
```
aws configure
AWS Access Key ID [None]: *******
AWS Secret Access Key [None]: ******
```

## Step 3) Install Kubectl in Linux
```
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version
```
## Step 4) Install aws iam authenticator in Linux
```
curl -o aws-iam-authenticator https://s3.us-west-2.amazonaws.com/amazon-eks/1.21.2/2021-07-05/bin/linux/amd64/aws-iam-authenticator
chmod +x ./aws-iam-authenticator
sudo mv aws-iam-authenticator /usr/local/bin/
aws-iam-authenticator version

```
## Step 5) Install EKSCTL  in linux
```
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
eksctl version
```
## Step 6) Execute identity command
```
aws sts get-caller-identity
```
## step 7) Create EKS cluster with below command
```
eksctl create cluster --version 1.31 --region us-east-1 --node-type t2.micro --nodes 3 --name mhr-demo-cluster
```
## 8) Connect the EKS cluster form ec2 instance  with below command
```
aws eks update-kubeconfig --region us-east-1 --name mhr-demo-cluster
kubectl get nodes
```
########################
## Install helm in linux
```
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

```
## create the pod in kubernetes with command line
```
kubectl run hanu  --image nginx
```
## Deploy the pod in kubernetes cluster with yaml 
```
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
  - name: nginx
    image: nginx:1.14.2
    ports:
    - containerPort: 80
```
- kubectl create -f pod.yaml  --> to create through manifest file
## Delete the pod in the kubernetes cluster
```
kubectl delete pod hanu
```  
or
```
kubectl delete -f pod.yaml
```
## list pods in the default namespace
```
kubectl get pods 
```
or
```
kubectl get po  
```
## To know the details of the pod wiht bleow command
```
kubectl describe pod <podname>
```

## Below command is used to login into the pod
```
kubectl exec -it <podname> /bin/bash
```
## Replicaset 
- it is used to  maintain or runs always same number of pods as mentioned 
  in the manifest file
```
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: my-replicaset
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
      - name: my-container
        image: nginx
```
- kubectl create -f replicaset.yaml  # to create replicaset
- kubectl get replicaset  --> to list the replicaset
or
- kubectl get rs  --> to list the replicaset
- kubectl delete rs <replicasetname>  -->   to delete the replicaset
- kubectl delete pod <podname> # To delete pod
- Note: even if you are deleted pod then automatically it will creae new pods
  becuase replicaset will make sure  maintain same no of pods as we mentioned in the mainfest file
## kubernetes Deployment :
kubernetes deployment has some advantages as compared to Replicaset
- 1) we can increase the pods and decrease the pods count through commnad line
- 2) we can rollout and rollback the version easly with deployment
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
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
```
## Commands create,get ,descirbe and delete the deployment
- kubectl create -f deployment.yaml
- Kubectl get deployments
- kubectl get all
- kubectl describe deployment <deployment name>
- kubect delete -f deployment.yaml
- kubectl delete deployment <deploymentname>
## update the deployment with new image version
- kubectl set image deployment.v1.apps/nginx-deployment mhr-container=nginx:1.16.1
  - or 
- kubectl set image deployment/nginx-deployment mhr-container=nginx:1.16.1
  - or
- kubectl edit deployment/nginx-deployment
- kubectl apply -f deployment.yaml
## To know the status and history of the deployment
 - kubectl rollout status deployment/nginx-deployment  # To know the status of deployment
 - kubectl rollout history deployment/nginx-deployment # To know the rollout history
 - kubectl rollout history deployment/nginx-deployment --revision=3  # To know the image version details for the 
   particular revsion
## Roll back to the previous of the deployment
 - kubectl rollout undo deployment/nginx-deployment  # Roll back to the previous version of the deployment
 - kubectl rollout undo deployment/nginx-deployment --to-revision=2 # Roll back back to the required version of 
   deployment(example version 2)
## Scale in and scale oot replicas
 - kubectl scale deployment/nginx-deployment --replicas=2
 - kubectl scale deployment/nginx-deployment --replicas=5
## Deployement in command line
- kubectl create deployment hello-node --image=k8s.gcr.io/echoserver:1.4
- kubectl expose deployment hello-node --type=NodePort --port=8080
- Reference doc: https://kubernetes.io/docs/concepts/workloads/controllers/deployment/
## Namespace:
- name space is noting but a virtual cluster
- namespace is used to isolate the reosuces or application in the k8 cluster
- Genrall a cluster can divided into number of namespaces as per our requirement
- by default we have some namespaces in the cluster
- kubectl get namespaces  --> to list the namespaces
   or 
- kubectl get ns ---> --> to list the namespaces
## create name space in the cluster
- kubectl create  namespace <namespacename>
   - Ex: kubectl create namespace dev  # create the dev namespace
  or
- kubectl create -f namespace.yaml # Create the the namespace
```
apiVersion: v1
kind: Namespace
metadata:
  name: qa
```
- kubectl create -f deployment.yaml  ---> inside we can namespace details 
to deployment particualar namespace

## deployment in particular namespace
```
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
```
- kubectl get pods -n dev  # list the pods in the dev namespace
- kubectl get pods -all-namespaces  # list pods in the all namespaces
- kubectl delete namespace dev  #delete the dev namespace
   or 
- kubectl delete -f namespace.yaml # delete the namespace

- kubectl create -f deployment.yaml -n dev  --> deployemt pods in to the dev
- kubectl config set-context $(kubectl config current-context) --namespace=dev # set dev name space   
  permaently it we used this command
----------------------

## Taint
 - usually Taints are applying on the nodes
 - Taint is used to restricts the scheduling the pods on the nodes. nodes are
   allowing the nodes only when pods are having toleration
```
kubectl taint nodes node-name key=value:taint-effct
kubectl taint nodes node1 app=blue:Noschedule
```

## Tolerations
 - Toleration are application on pod
 - Toleration are used to schdueling pods on the taints nodes
 ```
 apiVersion: v1
 kind: pod
 metadata:
   name: sales-app
 spec:
   containers:
   - name: sales-container
     image:  nginx
   tolerations:
   - key: "app"
     operator: "equal"
     value: blue
     effct: Noschedule
 ```
 
 

## create configmap through Imperative mode
application.properties
```
name=hanu
lives=34578
enemies.cheat=true
enemies.cheat.level=noGoodRotten
secret.code.passphrase=UUDDLRLRBABAS
secret.code.allowed=true
secret.code.lives=30
```
```
kubectl create configmap gmae-config --from-file=application.properties
```
## create configmap in  Declarative Mode

configmap.yaml
```
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
```
```
kubectl create -f configmap.yaml
```
## inject the configmap into pod
apiVersion: v1
kind: Pod
metadata:
  name: configmap-demo-pod
spec:
  containers:
    - name: demo
      image: alpine
      command: ["sleep", "3600"]
      env:
      volumeMounts:
      - name: config
        mountPath: "/config"
        readOnly: true
  volumes:
  # You set volumes at the Pod level, then mount them into containers inside that Pod
  - name: config
    configMap:
      # Provide the name of the ConfigMap you want to mount.
      name: mhr-co
      
      # An array of keys from the ConfigMap to create as files
      items:
      - key: "application.properties"
        path: "application.properties"
```

or
```
apiVersion: v1
kind: ConfigMap
metadata:
  name: test-config
data:
  # property-like keys; each key maps to a simple value
  player_initial_lives: "3"
  ui_properties_file_name: "user-interface.properties"

  # file-like keys
  game.properties: |
    enemy.types=aliens,monsters
    player.maximum-lives=5    
  user-interface.properties: |
    color.good=purple
    color.bad=yellow
    allow.textmode=true   
```
# how to create,get and delete configmaps
- kubectl create -f configmap.yaml # To create configmap in default namespace
- kubectl create  -f confinmap.yaml -n dev # # To create configmap in dev namespace
- kubectl get configmaps # to list the configmaps in default namespaces
- kubectl get configmpas -n dev # To list the configmaps in the dev namespace
- kubectl delete confimap <configmap> # To delete confimap in the default namespace
  - or
- kubectl delete -f configmap.yaml # To delete confimap in the default namespace with file (we have to used same file which we have used for creating)

or 
kubectl create configmap hanu-config --from-file=hanu.properties --Create 
configmap by command line
## use the configmap while creating the pod
```
apiVersion: v1
kind: Pod
metadata:
  name: configmap-test-pod
spec:
  containers:
    - name: demo
      image: alpine
      command: ["sleep", "3600"]
      env:
        # Define the environment variable
        - name: PLAYER_INITIAL_LIVES # Notice that the case is different here
                                     # from the key name in the ConfigMap.
          valueFrom:
            configMapKeyRef:
              name: test-config           # The ConfigMap this value comes from.
              key: player_initial_lives # The key to fetch.
        - name: UI_PROPERTIES_FILE_NAME
          valueFrom:
            configMapKeyRef:
              name: test-config
              key: ui_properties_file_name
      volumeMounts:
      - name: config
        mountPath: "/config"
        readOnly: true
  volumes:
  # You set volumes at the Pod level, then mount them into containers inside that Pod
  - name: config
    configMap:
      # Provide the name of the ConfigMap you want to mount.
      name: test-config
      # An array of keys from the ConfigMap to create as files
      items:
      - key: "game.properties"
        path: "game.properties"
      - key: "user-interface.properties"
        path: "user-interface.properties"
```
## how to login into the pod
- kubectl exec -it mhr-test-pod /bin/sh
## use the configmap while creating the deployments
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
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
      - name: demo
        image: alpine
        command: ["sleep", "3600"]
        env:
          # Define the environment variable
          - name: PLAYER_INITIAL_LIVES # Notice that the case is different here
                                     # from the key name in the ConfigMap.
            valueFrom:
              configMapKeyRef:
                name: game-demo           # The ConfigMap this value comes from.
                key: player_initial_lives # The key to fetch.
          - name: UI_PROPERTIES_FILE_NAME
            valueFrom:
               configMapKeyRef:
                 name: game-demo
                 key: ui_properties_file_name
        volumeMounts:
         - name: config
           mountPath: "/config"
           readOnly: true
      volumes:
         # You set volumes at the Pod level, then mount them into containers inside that Pod
      - name: config
        configMap:
      # Provide the name of the ConfigMap you want to mount.
          name: game-demo
      # An array of keys from the ConfigMap to create as files
          items:
          - key: "game.properties"
            path: "game.properties"
          - key: "user-interface.properties"
            path: "user-interface.properties"
```


## Deployment with configmaps
```
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
```

-----------------------------
## Persistant volume
-----------------
```
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
```
## Persistant Volume Claim
```
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
```
## Persistant claim used by the pod
```
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
```
## create pv and pvc form EBS volume
Reference: https://medium.com/avmconsulting-blog/persistent-volumes-pv-and-claims-pvc-in-kubernetes-bd76923a61f6













