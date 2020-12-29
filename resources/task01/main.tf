# 1. Create vpc
# 2. Create Internet Group
# 3. Create Custom Route Table
# 4. Create a Subnet
# 5. Associate subnet with Route Table
# 6. Create a Security Group to all port 22, 80, 443
# 7. Create a network interface with an ip in the subnet that was create in step 4
# 8. Assign an elastic IP to the network interface created in step 7
# create Ubuntu Server and install/enable apache2

provider "aws" {
  region = "us-east-1"
}

#1
resource "aws_vpc" "test_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Test_VPC"
  }
}

#2
resource "aws_internet_gateway" "test_igw" {
  vpc_id = aws_vpc.test_vpc.id
  tags = {
    Name = "TEST_IGW"
  }
}

#3
resource "aws_route_table" "test_rt" {
  vpc_id = aws_vpc.test_vpc.id
  tags = {
    Name = "TEST_RT"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test_igw.id    
  } 

  route {
      ipv6_cidr_block = "::/0"
      gateway_id = aws_internet_gateway.test_igw.id
  }
}

#4
resource "aws_subnet" "test_subnet_1" {
  vpc_id = aws_vpc.test_vpc.id
  tags = {
    Name = "TEST_SUBNET"
  }
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

#5
resource "aws_route_table_association" "test_rta" {
  subnet_id = aws_subnet.test_subnet_1.id
  route_table_id = aws_route_table.test_rt.id
}

#6
resource "aws_security_group" "test_sg" {
  name = "allow_web_traffic"
  description = "Allow Web Inbound Traffic"
  vpc_id = aws_vpc.test_vpc.id

  ingress {
    description = "HTTPS"
    from_port = 443
    protocol = "tcp"
    to_port = 443
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  ingress {
    description = "HTTP"
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  ingress {
    description = "SSH"
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 0
    protocol = "-1"
    to_port = 0
  }
  
  tags = {
    Name = "allow_web_sg"
  }
}

#7
resource "aws_network_interface" "test_ni" {
    subnet_id = aws_subnet.test_subnet_1.id
    private_ips = ["10.0.1.50"]
    security_groups = [ aws_security_group.test_sg.id ]
}

#8 aws_eip relies on aws_internet_gateway
resource "aws_eip" "test_eip" {
    vpc = true
    network_interface = aws_network_interface.test_ni.id
    associate_with_private_ip = "10.0.1.50"
    depends_on = [ aws_internet_gateway.test_igw]
}

#9
resource "aws_instance" "web_server_instance" {
    ami = "ami-0885b1f6bd170450c"
    instance_type = "t2.micro"
    availability_zone = "us-east-1a"
    tags = {
      Name = "web-server"
    }

    network_interface {
        device_index = 0
        network_interface_id = aws_network_interface.test_ni.id        
    }

    user_data = <<-EOF
                #!/bin/sh
                sudo apt update -y
                sudo apt install -y apache2
                sudo systemctl start apache2
                sudo bash -c 'echo Hello World! Terraform Rocks :-) > /var/www/html/index.html'
                EOF
}

output "server_private_ip" {
    value = aws_instance.web_server_instance.private_ip
}
output "server_id" {
    value = aws_instance.web_server_instance.id
}
