# the variable is defined without any default value. It means that the value for this variable needs to be provided externally, either through command-line input or by using a Terraform variable file (terraform.tfvars)
// vars.tf

variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
    default = "ap-southeast-1"
}

variable "AMIS" {
    type = map(string)
    default = {
        ap-southeast-1: "ami-0f74c08b8b5effa56"
    }
}
