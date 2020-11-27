provider "aws" {
  region = "us-east-2"
}

resource "aws_db_instance" "myRDS" {
  name = "myDB"
  identifier = "first-rds"
  instance_class = "db.t2.micro"
  engine = "mariadb"
  engine_version = "10.2.21"
  username = "xxxx"
  password = "xxxx"
  port = 3306
  allocated_storage = 20
  skip_final_snapshot = true
} 
