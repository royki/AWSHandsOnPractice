provider "aws" {
    region = "us-east-2"    
}

variable ec2name {
    type = string
    default = "myec2"
}

variable "inputname" {
    type = string
    description = "Set ec2 instance name"
}

resource "aws_instance" "myec2" {
    ami = "ami-016b213e65284e9c9"
    instance_type = "t2.micro"
    tags = {
        Name = var.inputname
    }
}

output "ec2_id" {
    value = aws_instance.myec2.id
}