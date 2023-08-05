variable "cidr_blcok_vpc" {
  default = "192.168.0.0/24"
}
variable "cidr_blcok_subnet" {
 default = "192.168.10.0/24"
}
variable "vpc_tags" {

  default = "dev-vpc"
}
variable "subnet_tags" {
  default = "dev-pub-subnet"
  
}