
provider "aws" {

 region = "us-east-1"
 access_key = "XXXXXXXXXXXXXX"
 secret_key = "XXXXXXXXXXXXXXXX"

}


resource "aws_vpc" "vpc" {
  cidr_block = "10.40.0.0/16"


tags = {
  name = "dev-vpc"
}
}
