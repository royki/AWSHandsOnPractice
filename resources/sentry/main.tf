# Provider AWS
provider "aws" {
  region = "us-east-1"
}

# Create Security Group
resource "aws_security_group" "snt_sg" {
  name = "allow_web_traffic"
  description = "Allow Web Inbound Traffic"

  ingress {
    description = "HTTPS"
    from_port = 443
    protocol = "tcp"
    to_port = 443
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  ingress {
    description = "HTTP"
    from_port = 9000
    protocol = "tcp"
    to_port = 9000
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  ingress {
    description = "SSH"
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 0
    protocol = "-1"
    to_port = 0
  }
  
  tags = {
    Name = "allow_web_sg"
  }
}

# Create EC2 Instance. Using existing key pair. It is necessary to ssh to the instance. If you don't want to ssh, comment key_name.
resource "aws_instance" "snt_onpremis_instance" {
    ami = "ami-00ddb0e5626798373" # Ubuntu Server 18.04 LTS
    instance_type = "t2.medium"
    availability_zone = "us-east-1a"
    key_name = "test_key_pair"
    vpc_security_group_ids = [aws_security_group.snt_sg.id]

    root_block_device {
      volume_type = "gp2"
      volume_size = 50
    }

    tags = {
      Name = "snt-server"
    }
   
    user_data = <<-EOF
                #!/bin/sh
                sudo apt update -y
                sudo apt install python-apt
                EOF
}

output "server_private_ip" {
    value = aws_instance.snt_onpremis_instance.private_ip
}
output "server_public_ip" {
    value = aws_instance.snt_onpremis_instance.public_ip
}
output "server_id" {
    value = aws_instance.snt_onpremis_instance.id
}
