# VPC -----------------------------------------------------
resource "aws_vpc" "myvpc" {
  cidr_block       = var.cidr_vpc_block
  instance_tenancy = "default"

  tags = {
    Name = "myvpc"
  }
}

# Get 4 availability zones
data "aws_availability_zones" "azs" {}

# Subnets --------------------------------------------------
resource "aws_subnet" "mysub" {
  count = 3

  vpc_id            = aws_vpc.myvpc.id
  availability_zone = data.aws_availability_zones.azs.names[count.index]
  cidr_block        = var.subnet_cidrs[count.index]

  map_public_ip_on_launch = true

  tags = {
    Name = "mysubnet-${count.index + 1}"
  }
}

# Internet gateway ------------------------------------------
resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "myigw"
  }
}

# Route Table -------------------------------------------------------
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

# Associate Route Table with all 4 Subnets ---------------------------------------------
resource "aws_route_table_association" "mysub_assoc" {
  count          = 3
  subnet_id      = aws_subnet.mysub[count.index].id
  route_table_id = aws_route_table.myrt.id
}

# EC2 Instances (4 Instances) ---------------------------------------------
resource "aws_instance" "myec2" {
  count = 1

  ami           = var.image_name
  instance_type = var.inst_type
  key_name      = var.keyname

  subnet_id = aws_subnet.mysub[count.index].id

  tags = {
    Name = "dev-${count.index + 1}"
  }
}
