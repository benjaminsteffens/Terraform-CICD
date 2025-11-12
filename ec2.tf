resource "aws_instance" "ec2_1" {
  ami           = "ami-0ecb62995f68bb549"
  instance_type = "t2.micro"

  subnet_id = subnet-017f9e5639672982d 

  vpc_security_group_ids = ["sg-0ffc5fa9ee33421ef"] 

  tags = {
    Name = "My-Fixed-EC2-Instance"
  }
}

}