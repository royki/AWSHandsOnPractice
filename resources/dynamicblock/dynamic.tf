provider "aws" {
    region = "us-east-2"    
}

variable "ingressrules" {
    type = list(number)
    default = [80,443]
}

variable "engressrules" {
    type = list(number)
    default = [80,443,25,3306,53,8080]
}

resource "aws_instance" "myec2" {
    ami = "ami-016b213e65284e9c9"
    instance_type = "t2.micro"
    security_groups= [aws_security_group.sg-webtraffic.name]
    tags = {
        Name = "TerraformEC2"
    }
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
