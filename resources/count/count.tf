provider "aws" {
    region = "us-east-2"
}

resource "aws_instance" "ec2" {
    ami = "ami-016b213e65284e9c9"
    instance_type = "t2.micro"
    tags = {
        Name = "TerraformEC2"
    }
    count = 3
}