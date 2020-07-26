provider "aws" {
    region = "us-east-2"
}

variable "number_of_servers" { 
    type = number
}

resource "aws_instance" "ec2" {
    ami = "ami-016b213e65284e9c9"
    instance_type = "t2.micro"
    tags = {
        Name = "TerraformEC2"
    }
    count = var.number_of_servers
}

# Command to run & select vars file
# terrafomr plan -var-file=test.tfvars
# terrafomr plan -var-file=prod.tfvars