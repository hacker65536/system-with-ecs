resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags   = "${merge(var.tags,map("Name",format("%s-igw",terraform.workspace)))}"
}
