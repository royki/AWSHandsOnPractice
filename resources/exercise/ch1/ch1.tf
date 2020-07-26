provider "aws" {
    region = "us-east-2"
}

resource "aws_vpc" "cha1Vpc" {
    cidr_block = "192.168.0.0/24"
    tags = {
        Name = "TerraformVPC"
    }
}