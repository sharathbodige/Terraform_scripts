resource "aws_instance" "test2" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.keypair
  security_groups = ["default"]
  tags = {
    Name = "Ubuntu-test2"
  }
}