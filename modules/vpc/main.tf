resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  enable_dns_support = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostname
  tags = merge(var.tags, {
    Name = join("-", [var.tags["Env"], var.tags["Project"]])
  })
}

resource "aws_subnet" "public" {
  for_each = var.public_cidrs
  vpc_id = aws_vpc.main.id
  availability_zone = each.key
  cidr_block = each.value
   map_public_ip_on_launch = true
  tags = merge(var.tags, {
    Name = join("-", [var.tags["Env"], var.tags["Project"], each.key])
  })
}

resource "aws_subnet" "private" {
  for_each = var.private_cidrs
  vpc_id = aws_vpc.main.id
  availability_zone = each.key
  cidr_block = each.value
   map_public_ip_on_launch = false
  tags = merge(var.tags, {
    Name = join("-", [var.tags["Env"], var.tags["Project"], each.key])
  })
}