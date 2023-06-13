resource "aws_instance" "example" {
    ami = var.AMIS[var.AWS_REGION]
    instance_type = "t2.micro"

    # the VPC subnet
    subnet_id = aws_subnet.main-public-1.id

    # the security group
    vpc_security_group_ids = [aws_security_group.allow-ssh.id]

    # the public SSH key
    key_name = aws_key_pair.mykeypair.key_name
}

output "public_ip_address" {
  value = aws_instance.example.public_ip
}


resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = "ap-southeast-1a"
  size = 20
  type = "gp2"
  tags = {
    Name = "extra volume data"
  }
}

resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name = "/dev/xvdh"
  volume_id = aws_ebs_volume.ebs-volume-1.id
  instance_id = aws_instance.example.id
  # stop_instance_before_detaching = true: This flag indicates that the EC2 instance should be stopped before detaching the EBS volume. When set to true, Terraform will stop the instance, detach the volume, and then start the instance again.
  stop_instance_before_detaching = true
}

