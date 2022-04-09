/* Elastic Ip */

resource "aws_eip" "eip" {
    vpc = true
  
}