
#vpc -----------------------------------------------------
resource "aws_vpc" "myvpc" {
  cidr_block       = var.cidr_vpc_block
  instance_tenancy = "default"

  tags = {
    Name = "myvpc"
  }
}

# security group is getting through VPC ID----------------------
#data "aws_default_security_group" "default_sg" {
#  vpc_id = aws_vpc.myvpc.id
#}



#subnet --------------------------------------------------
resource "aws_subnet" "mysub" {

  vpc_id            = aws_vpc.myvpc.id
  availability_zone = var.avail_zone
  cidr_block        = var.sub1_cidr_range

  tags = {
    Name = "mysubnet"
  }

  map_public_ip_on_launch = true

}


#Internet gateway------------------------------------------
resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "myigw"
  }
}


# Route Table-------------------------------------------------------
resource "aws_route_table" "myrt" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }

  tags = {
    Name = "myrt"
  }
}


# Associate Route Table with Subnet---------------------------------------------
resource "aws_route_table_association" "mysub_assoc" {
  subnet_id      = aws_subnet.mysub.id
  route_table_id = aws_route_table.myrt.id
}



#instance ---------------------------------------------
resource "aws_instance" "myec2" {

  count = 1
  ami           = var.image_name
  instance_type = var.inst_type
  key_name      = var.keyname


  subnet_id = aws_subnet.mysub.id

  #vpc_security_group_ids = [data.aws_default_security_group.default_sg.id]


  tags = {
    Name = "Ubuntu-vpc-ec2"
  }
}