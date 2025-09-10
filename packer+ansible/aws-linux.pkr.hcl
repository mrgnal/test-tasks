packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "amazon-linux" {
  ami_name      = "learn-packer-linux-aws"
  instance_type = "t3.micro"
  region        = "eu-north-1"
  source_ami_filter {
    filters = {
      name                = "al2023-ami-2023.8.20250818.0-kernel-6.12-x86_64"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["137112412989"]
  }
  ssh_username = "ec2-user"
}

build {
  name    = "learn-packer"
  sources = [
    "source.amazon-ebs.amazon-linux"
  ]

  provisioner "ansible"{
    playbook_file = "./playbook.yml"
  }
}
