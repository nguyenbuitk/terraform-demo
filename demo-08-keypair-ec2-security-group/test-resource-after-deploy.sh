#!/bin/bash

# Get the public IP address using Terraform output command
public_ip=$(terraform output -raw public_ip_address)

# Print the public IP address
echo "Public IP address: $public_ip"

# Test ping
ping -c 3 $public_ip
echo "exit code: $?"

# Test SSH connectivity to the instance
ssh_status=$(ssh -i mykey -o BatchMode=yes -o ConnectTimeout=5 -o StrictHostKeyChecking=no ubuntu@$public_ip echo success 2>&1)
if [[ $ssh_status == "success" ]]; then
    echo "SSH connection to the instance is successful."
else
    echo "SSH connection to the instance failed."
fi

## to do
# Show output when exit code is 0 or 1
# Learn about the ssh command above
