resource "aws_instance" "ec2_1" {
  ami           = "ami-0ecb62995f68bb549"
  instance_type = "t2.micro"

}