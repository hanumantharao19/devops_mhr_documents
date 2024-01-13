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


## Deploy the pod in kubernetes cluster
kubectl run hanu  --image nginx ## create the pod in command line
or
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

- kubectl delete pod hanu  ---> to delete the pod
or
- kubectl delete -f pod.yaml  --> to delete the pod
kubectl get pods --> to list pods in default namespaces
or
kubectl get po  -->to list pods in default namespaces
kubectl exec -it <podname> /bin/bash

## Namespace:
- name space is noting but a virtual cluster
- Genrall a cluster can divided into number of namespaces as 
  per our requirement
- by default we have some namespaces in the cluster
- kubectl get namespaces  --> to list the namespaces
   or 
- kubectl get ns ---> --> to list the namespaces
Replicaset
-------------
Replicaset is used to  maintain or runs always same number of pods as mentioned 
in the manifest file
- kubectl create -f replicaset.yaml  # to create replicaset
```
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
```
- kubectl get replicaset  --> to list the replicaset
or
- kubectl get rs  --> to list the replicaset
- kubectl delete rs <replicasetname>  -->   to delete the replicaset
- kubectl delete pod <podname> # To delete pod
- Note: even if you are deleted pod then automatically it will creae new pods
  becuase replicaset will make sure  maintain same no of pods as we mentioned in the mainfest file(replicaset    file)


kubernetes Deployment :
------------------
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
## create the deployment and delete the deployment
- kubectl create -f deployment.yaml
- kubect delete -f deployment.yaml
- kubectl delete deployment <deploymentname>
# update the deployment with new image version
- kubectl set image deployment.v1.apps/nginx-deployment mhr-container=nginx:1.16.1
  - or 
- kubectl set image deployment/nginx-deployment mhr-container=nginx:1.16.1
  - or
- kubectl edit deployment/nginx-deployment

# To know the status and history of the deployment
 - kubectl rollout status deployment/nginx-deployment  # To know the status of deployment
 - kubectl rollout history deployment/nginx-deployment # To know the rollout history
 - kubectl rollout history deployment/nginx-deployment --revision=3  # To know the image version details for the 
   particular revsion

# Roll back to the previous of the deployment
 - kubectl rollout undo deployment/nginx-deployment  # Roll back to the previous version of the deployment
 - kubectl rollout undo deployment/nginx-deployment --to-revision=2 # Roll back back to the required version of 
   deployment(example version 2)
# Scale in and scale oot replicas
 - kubectl scale deployment/nginx-deployment --replicas=2
 - kubectl scale deployment/nginx-deployment --replicas=5

## Deployement in command line
- kubectl create deployment hello-node --image=k8s.gcr.io/echoserver:1.4
- kubectl expose deployment hello-node --type=NodePort --port=8080

- Reference doc: https://kubernetes.io/docs/concepts/workloads/controllers/deployment/

## Create name space
- kubectl get namespaces # To list the existing namespaces
  or
-  kubectl get ns  # To list the existing namespaces
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
- kubectl delete namespace dev  #delete the dev namespace
   or 
- kubectl delete -f namespace.yaml # delete the namespace

- kubectl create -f deployment.yaml -n dev  --> deployemt pods in to the dev
```
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
```
- kubectl get pods -n dev ---> list the all pods in the dev namespace
- Reference: https://kubernetes.io/docs/tasks/administer-cluster/namespaces/
----------------------
## creae config mpa with application property file

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
      name: mhr-config
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













