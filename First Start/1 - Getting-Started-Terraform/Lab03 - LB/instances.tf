##################################################################################
# DATA
##################################################################################

# ami --amazon machine image
data "aws_ssm_parameter" "ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

##################################################################################
# RESOURCES
##################################################################################

# INSTANCES 
resource "aws_instance" "nginx1" {
  ami                    = nonsensitive(data.aws_ssm_parameter.ami.value)
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.subnet1.id
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
	echo '<html><head><title>Test-SRV-1</title></head><body><p><span>This is a test-SRV-1</span></span></p></body></html>' | sudo tee /usr/share/nginx/html/index.html
  EOF

  tags = local.common_tags

}

resource "aws_instance" "nginx2" {
  ami                    = nonsensitive(data.aws_ssm_parameter.ami.value)
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.subnet2.id
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
	echo '<html><head><title>Test-SRV2</title></head><body><p><span>This is a test from SRV-2</span></span></p></body></html>' | sudo tee /usr/share/nginx/html/index.html
  EOF

  tags = local.common_tags

}
