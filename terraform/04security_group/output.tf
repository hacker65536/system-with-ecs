output "ips" {
  value = "${chunklist(var.dev_ips, 40)}"
}

output "sg_dev" {
  value = "${aws_security_group.sg_dev.*.id}"
}

output "sg_sec" {
  value = "${aws_security_group.sg_sec.*.id}"
}
