data "aws_subnet_ids" "public_subnets" {
  vpc_id = "${data.terraform_remote_state.vpc.vpc_id}"

  tags {
    Public = true
  }
}

resource "aws_route_table_association" "rtb_assoc" {
  count          = "${length(data.aws_subnet_ids.public_subnets.ids)}"
  subnet_id      = "${element(data.aws_subnet_ids.public_subnets.ids,count.index)}"
  route_table_id = "${data.terraform_remote_state.vpc.rtb_id}"
}
