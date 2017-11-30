variable "subnet_tags" {
  default = [
    {
      Nat    = true
      Public = true
    },
    {
      Nat    = true
      Public = true
    },
    {
      Public = true
    },
    {
      Public = true
    },
    {
      Ecs     = true
      Private = true
    },
    {
      Ecs     = true
      Private = true
    },
    {},
    {},
  ]
}

resource "aws_subnet" "subnet" {
  count             = "8"
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${cidrsubnet(aws_vpc.vpc.cidr_block,8,count.index)}"
  availability_zone = "${data.aws_availability_zones.azs.names[count.index%2]}"
  tags              = "${merge(var.tags,map("Name",format("%s-sub-%d%s",terraform.workspace,count.index,substr(data.aws_availability_zones.azs.names[count.index%2], -1,1))),var.subnet_tags[count.index])}"
}
