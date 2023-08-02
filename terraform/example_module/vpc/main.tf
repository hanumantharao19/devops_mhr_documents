provider "aws" {


region = "us-east-2"

}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "pavan-vpc"
  cidr = "10.70.0.0/16"

  azs             = ["us-east-2a"]
  private_subnets = ["10.70.1.0/24"]
  public_subnets  = ["10.70.101.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true
  enable_dns_hostnames = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
