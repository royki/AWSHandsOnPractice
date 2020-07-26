variable "instance_id" {
    type = string
}

resource "aws_eip" "ec2_web" {
    instance = var.instance_id
}

output "PublicIP" {
    value = aws_eip.ec2_web.public_ip
}