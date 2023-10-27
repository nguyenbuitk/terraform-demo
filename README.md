# Terraform Demo 

This Terraform project demonstrates how to set up a simple infrastructure using Terraform. It creates an AWS EC2 instance and outputs the instance details.

## Prerequisites

Before you begin, make sure you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html)
- AWS CLI configured with access to your AWS account

## Getting Started

Follow these steps to create the infrastructure using Terraform:

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/nguyenbuitk/terraform-demo.git
   cd terraform-demo/demo-01
   ```

2. Initialize the Terraform working directory:
   ```bash
   terraform init
   ```

3. Review and customize the main.tf file according to your needs. You can modify instance type, region, and other parameters.
Apply the Terraform configuration:
   ```bash
   terraform apply
   ```

4. Cleaning Up
To destroy the created resources and clean up your environment, use:
   ```bash
   terraform destroy
   ```
   Follow the prompts to confirm the resource deletion.

Contributions
Contributions are welcome! If you find issues or want to enhance this Terraform project, feel free to create a pull request.