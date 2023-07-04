Terraform
----------
Terraform is IAC(Infrastrcture as code) tool
Terraform is used to create infra in mutiple cloud like aws ,GCP and Azure


Steps to install terraform
--------------------------
1) create a ec2 instance with redhat or centos 
2 install terraform with following commndas
Refer: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform

terraform --version


step2) while creating  a role assign required permission
and attach role to the ec2 instance


step3) create a folder in server and write terraform configuration file

vim main.tf

provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "dev-vpc" {
  cidr_block       = "192.168.0.0/16"

  tags = {
    Name = "mhr-vpc-dev"
  }
}
-----------------------
terraform init --> it is used to initailse the terraform provider plugins
terraform plan ---> it will blue print or infromation which want to be create

terraform.tfstate ---> it is used to store the actual resouce which we have
created in aws


terraform destroy ---> it will delete infra based terraform config files






