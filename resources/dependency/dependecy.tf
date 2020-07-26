provider "aws" {
    region = "us-east-2"
}

resource "aws_instance" "db" {
    ami = "ami-016b213e65284e9c9"
    instance_type = "t2.micro"
    tags = {
        Name = "TerraformEC2-db"
    }
}

resource "aws_instance" "web" {
    ami = "ami-016b213e65284e9c9"
    instance_type = "t2.micro"
    tags = {
        Name = "TerraformEC2-web"
    }
    depends_on = [aws_instance.db]
}
