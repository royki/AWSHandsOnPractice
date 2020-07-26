provider "aws" {
    region = "us-east-2"    
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
    ingress {
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
