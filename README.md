🚀 Quick Start Guide
Ready to spin up some infrastructure? Follow these three simple steps:

1. The Terraform Files
Ensure your root directory contains valid Terraform configuration files (.tf) that define the EC2 instance and its dependencies (VPC, Security Group, etc.).

2. Configure GitHub Secrets
For the pipeline to authenticate with AWS, you must define the following three variables in your GitHub Repository Secrets (Settings > Secrets and variables > Actions):

AWS_ACCESS_KEY_ID

AWS_SECRET_ACCESS_KEY

AWS_REGION (e.g., us-west-2)

3. Commit and Push
Once the files are committed and the secrets are set, push your code to the main branch. The GitHub Action will automatically trigger and deploy your infrastructure in minutes.

🔒 Security Best Practices
Important: The AWS Access Keys used in the secrets should belong to an IAM User that adheres strictly to the Principle of Least Privilege. Grant this user only the permissions required to manage the specific resources defined in your Terraform files, and nothing more.



