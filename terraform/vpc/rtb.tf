resource "aws_default_route_table" "drtb" {
  default_route_table_id = "${aws_vpc.vpc.default_route_table_id}"
  tags                   = "${merge(var.tags,map("Name",format("%s-def-rt",terraform.workspace)))}"
}

resource "aws_route_table" "rtb" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags = "${merge(var.tags,map("Name",format("%s-igw-rt",terraform.workspace)))}"
}
