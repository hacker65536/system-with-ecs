resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  tags       = "${merge(var.tags,map("Name",format("%s-vpc",terraform.workspace)))}"
}
