resource "aws_instance" "ec2_1" {
  ami                         = "ami-00ecb62995f68bb549"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids      = ["sg-0ffc5fa9ee33421ef"]
  subnet_id                   = subnet_id = aws_subnet.sub_1.id

  tags = {
    Name = "Terraform-CICD"
  }
}