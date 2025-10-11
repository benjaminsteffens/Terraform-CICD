resource "aws_instance" "pipeec2" {
  ami                         = "ami-052064a798f08f0d3"
  instance_type               = "t2.micro"
  associate_public_ip_address = true

  tags = {
    Name = "githubactionsterrapipe"
  }
}