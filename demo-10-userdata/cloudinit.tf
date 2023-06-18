data "cloudinit_config" "cloudinit-example" {
    gzip = false
    base64_encode = false

    part {
        filename = "init.cfg"
        # the value "text/cloud-config" indicates that the part contains cloud-config data.
        content_type = "text/cloud-config"
        # defines the content of the part. It uses the templatefile function to render the content based on a template file located at "scripts/init.cfg". The template file may contain placeholders that can be replaced with values from Terraform variables, such as var.AWS_REGION in this case.
        content = templatefile("scripts/init.cfg",{
            REGION = var.AWS_REGION
        })
    }

    part {
        # this specifies the content type as a shell script.
        content_type = "text/x-shellscript"

        # defines the content of the shell script part.
        content = templatefile("scripts/volumes.sh",{
            DEVICE = var.INSTANCE_DEVICE_NAME
        })
    }
}
