resource "aws_instance" "ec2_web" {
    ami = "ami-016b213e65284e9c9"
    instance_type = "t2.micro"
    security_groups= [module.sg.sg_name]
    user_data = file("./ec2web/server-script.sh")
    tags = {
        Name = "TerraformEC2-WEB"
    }
}

module "eip" {
    source = "../eip"
    instance_id = aws_instance.ec2_web.id
    
}

module "sg" {
    source = "../sg"
}

output "instance_id" {
    value = aws_instance.ec2_web.id
}

output "web_public_ip" {
    value = module.eip.PublicIP
}