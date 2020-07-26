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

data "aws_instance" "dbsearch" {
    filter {
        name = "tag:Name"
        values = ["TerraformEC2-db"]
    }
}

output "dbservers" {
    value = data.aws_instance.dbsearch.availability_zone
}