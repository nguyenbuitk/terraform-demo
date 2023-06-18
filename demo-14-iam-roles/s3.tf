resource "aws_s3_bucket" "b" {
  bucket = "mybucket-c29df2c29df2"

  tags = {
    Name = "mybucket-c29df1"
  }
}
