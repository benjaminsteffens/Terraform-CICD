resource "aws_instance" "pipeec2" {
  ami                         = "ami-0360c520857e3138f"
  instance_type               = "t2.micro"
  associate_public_ip_address = true

  tags = {
    Name = "githubactionsterrapipe"
  }
}