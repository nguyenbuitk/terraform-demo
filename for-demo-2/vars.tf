variable "AWS_REGION" {
    type = string
    default = "ap-southeast-1"
}

variable "project_tags" {
    type = map(string)
    default = {
        Component = "Frontend"
        Enviroment = "Production"
    }
}
