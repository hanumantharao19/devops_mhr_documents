
- to know complete gcloud sdk info
```
gcloud info
```
- to know the only gcloud version
```
gcloud version
```
- it is help to check available gcloud commands
```
gcloud help
```
- Authorize Google Cloud access for the gcloud CLI with Google Cloud user credentials and set the current account as active.
```
gcloud auth login
```
- Display all the properties for the current configuration
```
gcloud config list
```
- Define a property (like compute/zone) for the current configuration
```
gcloud config set project <PROJECT_ID>
gcloud config set compute/region us-east1
gcloud config set compute/zone us-central1-a

gcloud config unset project 
gcloud config unset compute/region 
gcloud config unset compute/zone 
```
- List all VM instances in a project.
```
gcloud compute instances list
```
- Create compute instance
```
gcloud compute instances create dev-server --project=<projectid> --zone=us-central1-a --machine-type=e2-micro --imagefamily=debian-11 --image-project=debian-cloud
```
- stop compute instance
```
gcloud compute instances stop dev-server --zone=us-central1-a --project=<projectid>
```
- start the compute instance
```
gcloud compute instances stop dev-server --zone=us-central1-a --project=<projectid>
```
- create service service account
```
gcloud iam service-accounts create mhr-dev --description=mhr-dev-account --display-name="dev svc account" --project=<projectid>
```
- list service accounts
```
gcloud iam service-accounts list
```
- The command is used to remove credentials
```
gcloud auth revoke user@example.com
```