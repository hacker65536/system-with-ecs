output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "rtb_id" {
  value = "${aws_route_table.rtb.id}"
}

output "key_name" {
  value = "${aws_key_pair.key.key_name}"
}

output "nat_eip" {
  value = "${aws_eip.nat.id}"
}

#output "fingerprint" {
#  value      = "${aws_key_pair.key.fingerprint}"
#}
# depends_on is not working

