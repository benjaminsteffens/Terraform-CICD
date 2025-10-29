# This file defines the required providers and sets the AWS region.
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# The AWS provider is explicitly configured to use the 'us-east-1' region.
# Credentials are still expected to be supplied via environment variables 
# from your GitHub Actions workflow.
provider "aws" {
  region = "us-east-1"
}
