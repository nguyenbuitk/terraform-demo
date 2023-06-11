data "aws_ip_ranges" "ap_southeast_ec2" {
  regions  = ["ap-southeast-1", "ap-southeast-2"]
  services = ["ec2"]
}

resource "aws_security_group" "from_ap" {
  name = "from_ap"
  ingress {
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = slice(data.aws_ip_ranges.ap_southeast_ec2.cidr_blocks, 0, 50)
  }
  tags = {
    CreateDate = data.aws_ip_ranges.ap_southeast_ec2.create_date
    SyncToken  = data.aws_ip_ranges.ap_southeast_ec2.sync_token
  }
}
