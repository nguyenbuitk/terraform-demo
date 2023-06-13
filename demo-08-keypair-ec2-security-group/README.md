# Usage
Clone this repository to your local machine.
Navigate to the demo-8 folder.
Update the variables.tf file with your desired configuration.
Run terraform init to initialize the Terraform configuration.
Run terraform apply to apply the changes and provision the EC2 instance.
After successful provisioning, you will see the outputs displayed in the terminal.

# Testing Resources
To test the provisioned resources after running terraform apply, you can follow these steps:

## Obtain the public IP address of the provisioned EC2 instance from the Terraform output.
## Open an SSH client and connect to the EC2 instance using the following command:
```bash
ssh -i /path/to/private_key ec2-user@<public_ip_address>
```

Once connected to the EC2 instance, you can perform various tests and configurations
``` bash
# ping will fail because security group don't allow ping
ping public_ip_address
```

or use can run script "test-resource-after-deploy.sh" for testing
