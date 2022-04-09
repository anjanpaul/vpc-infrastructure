
/* Nat gateway */

resource "aws_nat_gateway" "nat-gateway" {
    for_each = var.public_cidrs
    allocation_id = "${aws_eip.eip.id}"
    subnet_id = "${aws_subnet.public[each.key].id}"
  
}