provider "aws" {
    region = "us-east-2"    
}


module "ec2module" {
    source = "./ec2"
    ec2name = "TerraformEC2"
}

output "module_output" {
    value = module.ec2module.instance_id
}
