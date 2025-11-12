resource "aws_instance" "ec2_1" {
  ami           = "ami-0de716d6197524dd9"
  instance_type = "t2.micro"

  tags = {
    Name = "terraformec2"
  }
}