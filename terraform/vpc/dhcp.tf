resource "aws_vpc_dhcp_options" "dhcp" {
  domain_name         = "${data.aws_region.current.name == "us-east-1" ? "ec2" : "${data.aws_region.current.name}.compute"}.internal"
  domain_name_servers = ["AmazonProvidedDNS"]

  tags = "${merge(var.tags,map("Name",format("%s-dhcp",terraform.workspace)))}"
}

resource "aws_vpc_dhcp_options_association" "dhcp_assoc" {
  vpc_id          = "${aws_vpc.vpc.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.dhcp.id}"
}
