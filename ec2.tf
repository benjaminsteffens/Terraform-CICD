resource "aws_instance" "Terraform-CICD" {
  ami           = "ami-0ecb62995f68bb549" 
  instance_type = "t2.micro" 

  tags = {
    Name = "Terraform-CICD"
}
}