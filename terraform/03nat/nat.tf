data "aws_subnet_ids" "nat" {
  vpc_id = "${data.terraform_remote_state.vpc.vpc_id}"

  tags {
    Nat = true
  }
}

resource "aws_nat_gateway" "natgw" {
  allocation_id = "${data.terraform_remote_state.vpc.nat_eip}"
  subnet_id     = "${data.aws_subnet_ids.nat.ids[0]}"
  tags          = "${merge(var.tags,map("Name",format("%s-nat",terraform.workspace)))}"
}
