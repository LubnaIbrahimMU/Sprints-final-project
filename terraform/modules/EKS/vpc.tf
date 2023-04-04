resource "aws_vpc" "lu" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "lu"
  }
}

