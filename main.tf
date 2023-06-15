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
  region = "us-west-2"
}

variable "public_key" {
  type        = string
  default = "~/.ssh/id_rsa.pub"
  description = "What is your SSH public key?"
}

resource "aws_key_pair" "home" {
  key_name   = "Public Key"
  public_key = var.public_key
}

variable "server_link" {
  type        = string
  description = "Check here https://www.minecraft.net/en-us/download/server"
}

resource "aws_security_group" "minecraft" {
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 25565
    to_port     = 25565
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "all"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Minecraft Server Security Group"
  }
}

resource "aws_instance" "minecraft" {
  ami                         = "ami-04e914639d0cca79a"
  instance_type               = "t2.small"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.minecraft.id]
  key_name                    = aws_key_pair.home.key_name
  user_data                   = "${file("install.sh")}"
  tags = {
    Name = "Minecraft Server"
  }
}

output "instance_ip_addr" {
  value = aws_instance.minecraft.public_ip
}
