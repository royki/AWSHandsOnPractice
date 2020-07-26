variable "server_names" {
    type = list(string)
}

resource "aws_instance" "ec2_db" {
    ami = "ami-016b213e65284e9c9"
    instance_type = "t2.micro"
    count = length(var.server_names)
    tags = {
        Name = var.server_names[count.index]
    }
}

# output "instance_id" {
#     value = aws_instance.ec2_db.id
# }

output "PrivateIP" {
    value = [aws_instance.ec2_db.*.private_ip]
}
