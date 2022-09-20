resource "aws_vpc" "vpc" {
    cidr_block = "10.10.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true
    instance_tenancy = "default"

    tags = {
      "Name" = "vpc"
    }
}

resource "aws_default_route_table" "route_table" {
    default_route_table_id = "${aws_vpc.vpc.default_route_table_id}"

    tags = {
      "Name" = "default route table"
    }
}

resource "aws_subnet" "public_subnet" {
    vpc_id = "${aws_vpc.vpc.id}"
    cidr_block = "10.10.1.0/24"
    availability_zone = "${data.aws_availability_zone.az.name}"
    map_public_ip_on_launch = true

    tags = {
      "Name" = "public subnet"
    }
}

resource "aws_subnet" "private_subnet" {
    vpc_id = "${aws_vpc.vpc.id}"
    cidr_block = "10.10.2.0/24"
    availability_zone = "${data.aws_availability_zone.az.name}"

    tags = {
      "Name" = "private subnet"
    }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags = {
    "Name" = "internet gateway"
  }
}

resource "aws_route" "route_to_gateway" {
  route_table_id = "${aws_vpc.vpc.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.internet_gateway.id}"
}

resource "aws_eip" "nat_eip" {
  vpc = true
  depends_on = [aws_internet_gateway.internet_gateway]
}

resource "aws_nat_gateway" "nat" {
  allocation_id = "${aws_eip.nat_eip.id}"
  subnet_id = "${aws_subnet.public_subnet.id}"
  depends_on = [
    aws_internet_gateway.internet_gateway
  ]
}

resource "aws_route_table" "private_route_table" { 
  vpc_id = "${aws_vpc.vpc.id}"

  tags = {
    "Name" = "private route table"
  }
}

resource "aws_route" "route_to_nat" {
  route_table_id = "${aws_route_table.private_route_table.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = "${aws_nat_gateway.nat.id}"
}

resource "aws_default_security_group" "security_group" {
  vpc_id = "${aws_vpc.vpc.id}"

  ingress {
    protocol = -1
    self = true
    from_port = 0
    to_port = 0
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}