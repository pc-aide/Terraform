##################################################################################
# PROVIDERS
##################################################################################

# Never put the acces_key & secret key in your hardCode
provider "aws" {
  access_key = ""
  secret_key = ""
  region = "us-west-2"
}

##################################################################################
# DATA
##################################################################################

# ami - amazon machine image
# How to get the list of ami ?
data "aws_ssm_parameter" "ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

##################################################################################
# RESOURCES
##################################################################################

# NETWORKING #
# vpc - virtual private cloud
resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_subnet" "subnet1" {
  cidr_block = "10.0.0.0/24"
  vpc_id = aws_vpc.vpc.id
  map_public_ip_on_launch = true
}

# ROUTING #
resource "aws_route_table" "rtb" {
  vpc_id = aws_vpc.vpc.id

	route {
		cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
    }
}

resource "aws_route_table_association" "rta-subnet1" {
  subnet_id = aws_subnet.subnet1.id
  route_table_id = aws_route_table.rtb.id
}

# SECURITY GROUPS #
# Nginx security group 
resource "aws_security_group" "nginx-sg" {
  name = "nginx_sg"
  vpc_id = aws_vpc.vpc.id
	
	# Inbound 
  # HTTP access from anywhere
	ingress  {
		from_port = 80
		to_port = 80
		protocol = "tcp"
		cidr_blocks = [ "0.0.0.0/0" ]
	} 

  # Outbound internet access
	# proto: -1 --
	egress  {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = [ "0.0.0.0/0" ]
	}
}

# INSTANCES
resource "aws_instance" "nginx1" {
	ami = nonsensitive(data.aws_ssm_parameter.ami.value)
	instance_type = "t2.micro"
	subnet_id = aws_subnet.subnet1.id
	vpc_security_group_ids = [aws_security_group.nginx-sg.id]

	user_data = <<EOF
	#! /bin/bash
	# install nginx1
	sudo amazon-linux-extras install -y nginx1

	# Service
	sudo service nginx start

	# Remove default index.html
	sudo rm /usr/share/nginx/html/index.html

	# Custom index.html
	echo '<html><head><title>Test</title></head><body><p><span>this is a test</span></span></p></body></html>' | sudo tee /usr/share/nginx/html/index.html
	EOF
}
