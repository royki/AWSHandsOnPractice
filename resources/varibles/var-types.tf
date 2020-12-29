provider "aws" {
    region = "us-east-2"    
}

# String
variable "vpcname" {
    type = string
    default = "myvpc"
}

# Number
variable "sshport" {
    type = number
    default = 22
}

# Boolean
variable "enabled" {
    default = true
}

# List
variable "mylist" {
    type = list(string)
    default = ["Value1", "Value2"]
}

# Map
variable "mymap" {
    type = map
    default = {
        key1 = "value1"
        key2 = "value2"
    }
}

# User Input
variable "inputname" {
    type = string
    description = "Set the name of the vpc"
}

variable "subnet_prefix" {
    description = "cidr block fro the subnet"
    default = "10.0.0.0/16"
    type = string
}
resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
      Name = "${var.vpcname}"
      Name = var.mylist[0]
      Name = var.mymap["key1"]
      Name = var.inputname
    }
}

output "vpcid" {
    value = aws_vpc.myvpc.id
}

variable "mytupple" {
    type = tupple([string, number, string])
    default = ["cat", 100, " dog"]
}

variable "myobject" {
    type = object({name = string, port = list(number)})
    default = {
        name = "royki"
        port = [22, 443, 80]
    }
}
