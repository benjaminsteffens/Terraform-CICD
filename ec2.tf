resource "aws_instance" "Terraform-CICD" {
  # 1. Required: Specify the OS image (AMI ID)
  ami           = "ami-00ecb62995f68bb549" 
  
  # 2. Required: Specify the instance size (type)
  instance_type = "t2.micro" 
}