


provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAQAKSVS3AO4QISV2M"
  secret_key = "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"
}

resource "aws_instance" "test" {
  ami             = "ami-0ecb62995f68bb549"
  instance_type   = "t3.micro"
  key_name        = "key"
  security_groups = ["default"]
  tags = {
    Name = "Ubuntu-test"
  }

}

