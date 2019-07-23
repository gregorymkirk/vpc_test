data "aws_caller_identity" "customer" {}

data "aws_region" "current" {}

data "aws_availability_zones" "available" {}

resource "aws_vpc" "vpc" {
  cidr_block           = "192.168.10.0/24"
  enable_dns_hostnames = "true"
  enable_dns_support   = "true"
}

resource "aws_subnet" "lb_subnet" {
  count                   = "${var.lb_subnets}"
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${cidrsubnet(cidrsubnet(cidrsubnet(var.vpc-cidr, var.newbits1, "1"), var.newbits2, "0"), var.lb_newbits, count.index)}"
  map_public_ip_on_launch = false
  availability_zone       = "${data.aws_availability_zones.available.names[count.index]}"
}

resource "aws_subnet" "data_subnet" {
  count                   = "${var.data_subnets}"
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${cidrsubnet(cidrsubnet(cidrsubnet(var.vpc-cidr, var.newbits1, "1"), var.newbits2, "1"), var.data_newbits, count.index)}"
  map_public_ip_on_launch = false
  availability_zone       = "${data.aws_availability_zones.available.names[count.index]}"
}

resource "aws_subnet" "app_subnet" {
  count                   = "${var.app_subnets}"
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${cidrsubnet(cidrsubnet(var.vpc-cidr, var.newbits1, "0"), var.app_newbits, count.index)}"
  map_public_ip_on_launch = false
  availability_zone       = "${data.aws_availability_zones.available.names[count.index]}"
}
