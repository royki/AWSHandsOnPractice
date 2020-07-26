provider "aws" {
    region = "us-east-2"    
}

resource "aws_instance" "myec2" {
    ami = "ami-016b213e65284e9c9"
    instance_type = "t2.micro"
    tags = {
        Name = "TerraformEC2"
    }
}

resource "aws_eip" "elasticIp" {
    instance = aws_instance.myec2.id
    tags = {
        Name = "TerraformEIP"
    }
}

output "EIP" {
    value = aws_eip.elasticIp.public_ip
}
