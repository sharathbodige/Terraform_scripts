variable "region" {
  default = "ap-south-2"
}



variable "cidr_vpc_block" {
  default = "10.0.0.0/16"
}

variable "subnet_cidrs" {
  type = list(string)
  default = [
    "10.0.0.0/18",   # Subnet 1
    "10.0.64.0/18",  # Subnet 2
    "10.0.128.0/18", # Subnet 3
    "10.0.192.0/18"  # Subnet 4
  ]
}

variable "image_name" {
  default = "ami-0e7938ad51d883574"
}

variable "inst_type" {
  default = "t3.micro"
}

variable "keyname" {
  default = "test"
}
