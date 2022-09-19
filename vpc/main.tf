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

