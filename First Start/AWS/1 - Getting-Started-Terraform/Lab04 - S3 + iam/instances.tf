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
  iam_instance_profile   = aws_iam_instance_profile.nginx_profile.name
  depends_on             = [aws_iam_role_policy.allow_s3_all]

  user_data = <<EOF
  #! /bin/bash
	# install nginx1
	sudo amazon-linux-extras install -y nginx1
	
  # Service
	sudo service nginx start
	
  # cp website to s3 bucket
  aws s3 cp s3://${aws_s3_bucket.web_bucket.id}/website/index.html /home/ec2-user/index.html
  aws s3 cp s3://${aws_s3_bucket.web_bucket.id}/website/Globo_logo_Vert.svg /home/ec2-user/Globo_logo_Vert.svg

  # Remove default index.html
	sudo rm /usr/share/nginx/html/index.html

  # Custom index.html
	sudo cp /home/ec2-user/index.html /usr/share/nginx/html/index.html
  sudo cp /home/ec2-user/Globo_logo_Vert.svg /usr/share/nginx/html/Globo_logo_Vert.svg
  EOF

  tags = local.common_tags
}

resource "aws_instance" "nginx2" {
  ami                    = nonsensitive(data.aws_ssm_parameter.ami.value)
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.subnet2.id
  vpc_security_group_ids = [aws_security_group.nginx-sg.id]
  iam_instance_profile   = aws_iam_instance_profile.nginx_profile.name
  depends_on = [
    aws_iam_role_policy.allow_s3_all
  ]

  user_data = <<EOF
  #! /bin/bash
	# install nginx1
	sudo amazon-linux-extras install -y nginx1
	
  # Service
	sudo service nginx start
	
  # cp website to s3 bucket
  aws s3 cp s3://${aws_s3_bucket.web_bucket.id}/website/index.html /home/ec2-user/index.html
  aws s3 cp s3://${aws_s3_bucket.web_bucket.id}/website/Globo_logo_Vert.svg /home/ec2-user/Globo_logo_Vert.svg

  # Remove default index.html
	sudo rm /usr/share/nginx/html/index.html

  # Custom index.html
	sudo cp /home/ec2-user/index.html /usr/share/nginx/html/index.html
  sudo cp /home/ec2-user/Globo_logo_Vert.svg /usr/share/nginx/html/Globo_logo_Vert.svg
  EOF

  tags = local.common_tags
}
