resource "aws_security_group" "sg_sec" {
  name_prefix = "${terraform.workspace}-sg-sec-"
  description = "sec"
  vpc_id      = "${data.terraform_remote_state.vpc.vpc_id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = "${merge(var.tags, map("Name",format("%s-sg-sec",terraform.workspace)))}"
}

resource "aws_security_group_rule" "sg_sec1" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "-1"
  self              = true
  security_group_id = "${aws_security_group.sg_sec.id}"
}

resource "aws_security_group_rule" "sg_sec2" {
  count = "${length(var.sec_ips)}"
  type  = "ingress"

  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["${element(var.sec_ips,count.index )}"]

  security_group_id = "${aws_security_group.sg_sec.id}"
}

locals {
  dev_ips = "${chunklist(var.dev_ips, 40)}"
}

resource "aws_security_group" "sg_dev" {
  count       = "${length(local.dev_ips)}"
  name_prefix = "${terraform.workspace}-sg-dev-"
  description = "dev"
  vpc_id      = "${data.terraform_remote_state.vpc.vpc_id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = "${merge(var.tags, map("Name",format("%s-sg-dev%d",terraform.workspace,count.index)))}"
}

resource "aws_security_group_rule" "sg_dev1" {
  count = "${length(local.dev_ips)}"
  type  = "ingress"

  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = "${local.dev_ips[count.index]}"

  #  description       = "${element(var.sec_ips,count.index * 2 + 1)}"
  security_group_id = "${aws_security_group.sg_dev.*.id[count.index]}"
}
