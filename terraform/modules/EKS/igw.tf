resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.lu.id

  tags = {
    Name = "igw"
  }
}
