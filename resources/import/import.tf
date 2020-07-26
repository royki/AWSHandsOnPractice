provider "aws" {
    region = "us-east-2"
}

resource "aws_vpc" "vpc_1" {
    cidr_block = "10.0.0.0/16"
}

resource "aws_vpc" "vpc_2" {
    cidr_block = "192.168.0.0/24"
}


# Command to import
# `terrform import aws_vpc.vpc_2 vpc-id`