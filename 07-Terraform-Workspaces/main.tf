


locals {
    instance_name = "${terraform.workspace}-instance"
}


resource "aws_instance" "my_ec2" {
    ami = var.image_name
    instance_type = var.instance_type
    key_name = var.key_name
    security_groups = ["default"]


    tags = {
        Name = local.instance_name
    }
}

