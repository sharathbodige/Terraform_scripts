

variable "cidr_vpc_block" {
  default = "10.0.0.0/16"
}


variable "avail_zone" {
  default = "us-east-1a"
}


variable "sub1_cidr_range" {
  default = "10.0.0.0/18"
}


variable "image_name" {
  default = "ami-0ecb62995f68bb549"
}


variable "inst_type" {
  default = "t3.micro"
}


variable "keyname" {

  default = "key"
}