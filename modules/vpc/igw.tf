/* Internet gateway */

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id
    tags = {
      Name = "${var.tags["Project"]}"
      Environment = "${var.tags["Project"]}"
    }

  
}