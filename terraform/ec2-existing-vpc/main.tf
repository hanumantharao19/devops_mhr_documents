provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "instance" {
  key_name   = "dev-mhr-instance-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_security_group" "mhr-dev-sg" {
  name   = "dev-mhr-security-group"
  vpc_id = "vpc-039d3435d98c7f2eb"

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}

resource "aws_instance" "server" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.instance.key_name
  vpc_security_group_ids = [aws_security_group.mhr-dev-sg.id]
  subnet_id              = "subnet-04c764d822bcda56e"
  associate_public_ip_address = true
  tags = var.tags
}

resource "null_resource" "provisioner" {
  depends_on = [aws_instance.server]

  triggers = {
    script_hash = sha1(file("setup.sh"))
    html_hash   = sha1(file("index.html"))
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/.ssh/id_rsa")
    host        = aws_instance.server.public_ip
  }

  # Upload both files
  provisioner "file" {
    source      = "setup.sh"
    destination = "/home/ec2-user/setup.sh"
  }

  provisioner "file" {
    source      = "index.html"
    destination = "/home/ec2-user/index.html"
  }

  # Run setup.sh on the instance
  provisioner "remote-exec" {
    inline = [
      "chmod +x /home/ec2-user/setup.sh",
      "bash /home/ec2-user/setup.sh"
    ]
  }
}

