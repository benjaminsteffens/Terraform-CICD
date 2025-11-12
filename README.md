# Deploy EC2 with Terraform via GitHub Actions

This repository contains the necessary Terraform configuration and a GitHub Actions workflow to automatically deploy an Amazon Web Services (AWS) EC2 instance whenever changes are pushed to the `main` branch.

Think of it as setting your infrastructure to "auto-pilot" – push your changes, and watch the magic happen (or, you know, the infrastructure provision).

## How It Works

This setup uses a **GitHub Actions workflow** to manage the infrastructure defined by the Terraform files in this repository.

1.  **Trigger:** A `push` event to the `main` branch triggers the workflow.
2.  **Checkout:** The repository code is checked out.
3.  **Setup:** Terraform CLI and AWS credentials are set up using GitHub Actions.
4.  **Terraform Workflow:** The standard Terraform commands are executed in sequence:
    * `terraform init` (Initializes the working directory)
    * `terraform fmt` (Formats the configuration)
    * `terraform validate` (Verifies the configuration syntax)
    * `terraform plan` (Creates an execution plan)
    * `terraform apply -auto-approve` (Applies the changes, provisioning the EC2 instance)
