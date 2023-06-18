variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}

variable "RDS_PASSWORD" {}

variable "AWS_REGION" {
    default = "ap-southeast-1"
}

variable "AMIS" {
    type = map(string)
    default = {
        ap-southeast-1: "ami-0f74c08b8b5effa56"
    }
}

variable "PATH_TO_PRIVATE_KEY" {
    default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
    default = "mykey.pub"
}

variable "INSTANCE_USERNAME"{
    default = "ubuntu"
}
