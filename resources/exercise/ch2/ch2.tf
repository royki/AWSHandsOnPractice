provider "aws" {
    region = "us-east-2"    
}

resource "aws_instance" "ec2_db" {
    ami = "ami-016b213e65284e9c9"
    instance_type = "t2.micro"
    tags = {
        Name = "TerraformEC2-DB"
    }
}

resource "aws_instance" "ec2_web" {
    ami = "ami-016b213e65284e9c9"
    instance_type = "t2.micro"
    security_groups= [aws_security_group.sg-webtraffic.name]
    user_data = file("server-script.sh")
    tags = {
        Name = "TerraformEC2-WEB"
    }
}

resource "aws_eip" "ec2_web_ip" {
    instance = aws_instance.ec2_web.id
}

variable "ingressrules" {
    type = list(number)
    default = [80,443]
}

variable "engressrules" {
    type = list(number)
    default = [80,443]
}

resource "aws_security_group" "sg-webtraffic" {
    name = "Allow HTTPS"

    dynamic "ingress" {
        iterator = port
        for_each = var.ingressrules
        content {
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
    dynamic "egress" {
        iterator = port
        for_each = var.engressrules
        content {
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
}

output "PrivateIP" {
    value = aws_instance.ec2_db.private_ip
}

output "PublicIP" {
    value = aws_eip.ec2_web_ip.public_ip
}