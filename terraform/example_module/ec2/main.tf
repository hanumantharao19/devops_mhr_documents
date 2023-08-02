provider "aws" {

region = "us-east-2"


}




module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "pavan-instance"

  instance_type          = "t2.micro"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
