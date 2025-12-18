resource "aws_instance" "test2" {
  count = 5 
  ami             = var.ami_my
  instance_type   = var.instance_type
  key_name        = var.keypair_imran
  security_groups = ["default"]
  tags = {
    Name = "Ubuntu-test_imran"
  }
}