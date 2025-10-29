# --- EC2 Instance Resource (Fully Checkov Compliant) ---
resource "aws_instance" "pipeec2" {
  # Good practice: Use a data source to fetch the latest Amazon Linux 2 AMI for the region
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = var.instance_type # Using var.instance_type for flexibility (default: t3.micro)
  
  # References the security group defined in security_group.tf
  vpc_security_group_ids = [aws_security_group.instance_sg.id] 
  
  # CKV_AWS_88 Fix: Disables public IP association (instance is now private).
  associate_public_ip_address = false 
  
  # CKV2_AWS_41 Fix: Attaches an IAM Role for required permissions (defined in iam.tf).
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name 

  # CKV_AWS_126 Fix: Enables detailed monitoring in CloudWatch.
  monitoring = true 
  
  # CKV_AWS_79 Fix: Enforces IMDSv2 (metadata service version 2) for access control.
  metadata_options {
    http_tokens   = "required"
    http_endpoint = "enabled"
  }
  
  # CKV_AWS_135 Fix: Ensures the instance is EBS optimized (compatible with t3.micro).
  ebs_optimized = true 

  # User data to set up a basic web server
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install httpd -y
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Hello from a Checkov Compliant EC2 Instance!</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name    = "githubactionsterrapipe"
    ManagedBy = "Terraform-CI-CD"
  }

  # CKV_AWS_8 Fix: Ensure the root EBS volume is encrypted by default.
  root_block_device {
    encrypted = true
  }
}

# --- Data Source to fetch the latest Amazon Linux 2 AMI ---
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# --- Output the Instance ID ---
output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.pipeec2.id
}
