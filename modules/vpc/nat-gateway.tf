
/* Nat gateway */

resource "aws_nat_gateway" "nat-gateway" {
    for_each = var.public_cidrs
    allocation_id = "${aws_eip.eip.id}"
    subnet_id = "${aws_subnet.public[each.key].id}"
    tags = merge(var.tags, {
    Name = join("-", [var.tags["Env"], var.tags["Project"],"nat-gateway", each.key])
  })
  
}

