resource "aws_instance" "ec2_db" {
    ami = "ami-016b213e65284e9c9"
    instance_type = "t2.micro"
    tags = {
        Name = "TerraformEC2-DB"
    }
}

output "instance_id" {
    value = aws_instance.ec2_db.id
}

output "PrivateIP" {
    value = aws_instance.ec2_db.private_ip
}