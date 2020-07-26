provider "aws" {
    region = "us-east-2"    
}


module "ec2db" {
    source = "./ec2db"
}

module "ec2web" {
    source = "./ec2web"
}

output "DBServer_PrivateIP" {
    value = module.ec2db.PrivateIP
}

output "WebServer_PublicIP" {
    value = module.ec2web.web_public_ip
}