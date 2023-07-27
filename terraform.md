Terraform
----------
Terraform is IAC(Infrastrcture as code) tool
Terraform is used to create infra in mutiple cloud like aws ,GCP and Azure


# Steps to install terraform
--------------------------
- 1) create a ec2 instance with redhat or centos 
- 2 install terraform with following commndas
    Refer: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
```
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform
```
- terraform --version # to know the terraform version

Step2) 
- create user in aws console and create access key and secrekey through aws console
- provide admin access for the user which we have created

or

step2) while creating  a role assign required permission
and attach role to the ec2 instance


step3) create a folder in server and write terraform configuration file

vim main.tf

provider "aws" {
  region = "us-east-1"
  accesskey = ""
  secretkey = ""
}

resource "aws_vpc" "dev-vpc" {
  cidr_block       = "192.168.0.0/16"

  tags = {
    Name = "mhr-vpc-dev"
  }
}

or
# if you using role based approch follow below code
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



# ec2 instance create
export AWS_ACCESS_KEY_ID=XXXXXX
export AWS_SECRET_ACCESS_KEY=XXXXXXXXXXXXXxxx


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}



ami-02b8534ff4b424939  us-east-2 redaht
ami-0263b519400e979e7  us-east-2  ubuntu



ami-00aa0673b34e3c150  us-west-2  redhat
ami-03f65b8614a860c29   us-west-2  ubntur








