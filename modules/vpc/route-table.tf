resource "aws_route_table" "example" {
  vpc_id = aws_vpc.main.id
  for_each = var.public_cidrs

  route {
    
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge(var.tags, {
    Name = join("-", [var.tags["Env"], var.tags["Project"],"public-route-table", each.key])
  })

  
}