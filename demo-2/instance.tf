# defines an AWS key pair resource named "mykey".

# SSH key pairs are unique. Show we create a "dummy key" pair on aws with public key. Then using private key to connect to ec2
resource "aws_key_pair" "mykey" {
    key_name = "dummy"
    public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "example" {
    ami = var.AMIS[var.AWS_REGION]
    instance_type = "t2.micro"
    key_name = aws_key_pair.mykey.key_name

    // The provisioner allows you to copy files from the local machine to the created instance.
    provisioner "file" {
        source = "script.sh"
        destination = "/tmp/script.sh"
    }

    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/script.sh",
            "sudo sed -i -e 's/\r$//' /tmp/script.sh",
            "sudo /tmp/script.sh"
        ]
    }

    connection {
        host = coalesce(self.public_ip, self.private_ip)
        type = "ssh"
        user = var.INSTANCE_USERNAME
        private_key = file(var.PATH_TO_PRIVATE_KEY)
    }
}
