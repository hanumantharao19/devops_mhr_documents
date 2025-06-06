variable "region" {
    default = "us-east-1"
  
}

variable "vpc_name" {
    default = "mhr-dev-vpc"
  
}

variable "vpc_cidr_block" {
    default = "192.165.0.0/16"
  
}

variable "igw_name" {
    default = "mhr-dev-igw"
  
}

variable "subnet_cidr_block" {
    default = "192.165.1.0/24"
  
}

variable "subnet_name" {
    default = "mhr-dev-subnet"
  
}

variable "routetable_name" {
    default = "mhr-dev-route-table"
  
}
