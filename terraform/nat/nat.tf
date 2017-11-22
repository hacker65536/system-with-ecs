data "aws_subnet_ids" "nat" {
  vpc_id = "${data.terraform_remote_state.rst.vpc_id}"

  tags {
    Nat = true
  }
}

resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "natgw" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${data.aws_subnet_ids.nat.ids[0]}"
  tags          = "${merge(var.tags,map("Name",format("%s-nat",terraform.workspace)))}"
}
