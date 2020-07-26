provider "aws" {
    region = "us-east-2"
}

module "db" {
    source = "./ec2db"
    server_names = ["mariadb", "mysql", "mssql"]   
}

output "private_ips" {
    value = module.db.PrivateIP
}