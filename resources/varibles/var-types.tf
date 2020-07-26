provider "aws" {
    region = "us-east-2"    
}

variable "vpcname" {
    type = string
    default = "myvpc"
}

variable "sshport" {
    type = number
    default = 22
}

variable "enabled" {
    default = true
}

variable "mylist" {
    type = list(string)
    default = ["Value1", "Value2"]
}

variable "mymap" {
    type = map
    default = {
        key1 = "value1"
        key2 = "value2"
    }
}

variable "inputname" {
    type = string
    description = "Set the name of the vpc"
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

