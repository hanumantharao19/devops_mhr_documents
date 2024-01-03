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
  region  = var.region
}

variable "region" {
    default = "us-east-2"
  
}

resource "aws_instance" "app_server" {
  ami           = var.amis[var.region]
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}

variable "amis" {
    type = map
    default = {
        us-east-1 = ""
        us-east-2 = "ami-011ab7c70f5b5170a"
    }
  
}


