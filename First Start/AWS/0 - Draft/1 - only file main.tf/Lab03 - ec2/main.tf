resource "aws_instance" "helloword" {
  # available only : us-east-1
  # required VPC default
  # ami_desc: ubuntu-focal-20.04-amd64-server-20200423
  ami           = "ami-068663a3c619dd892"
  instance_type = "t2.micro"

  tags = {
    Name = "helloword"
  }
}
