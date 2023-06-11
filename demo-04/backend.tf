terraform {
    backend "s3" {
        bucket = "terraform-state-f2"
        key = "terraform/myproject"
        region = "ap-southeast-1"
    }
}
