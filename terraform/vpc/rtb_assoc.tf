data "aws_subnet_ids" "public_subnets" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Public = true
  }
}

output "ids" {
  value = "${data.aws_subnet_ids.public_subnets.ids}"
}

resource "aws_route_table_association" "rtb_assoc" {
  count          = "${length(data.aws_subnet_ids.public_subnets.ids)}"
  subnet_id      = "${element(data.aws_subnet_ids.public_subnets.ids,count.index)}"
  route_table_id = "${aws_route_table.rtb.id}"
}
