################################################
# DATA
################################################


################################################
# RESOURCES
################################################

# Instances
# public_instances
resource "aws_instance" "nginx" {
  # EC2
  count         = var.instance_count
  ami           = var.instance_ami
  instance_type = var.instance_type

  # Network
  # % -> modulo (math)
  subnet_id              = module.vpc.public_subnets[(count.index % var.subnet_count)]
  vpc_security_group_ids = [aws_security_group.nginx-sg.id]

  # bootstrap
  # if we change code, so need to destroy to have new changes ?
  user_data = file("./userdata.sh")

  tags = local.common_tags
}

# private_instances
