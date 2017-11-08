resource "aws_s3_bucket" "remote_state" {
  bucket = "${terraform.workspace}-remote-state-bucket"
  acl    = "private"
  tags   = "${var.tags}"

  #  force_destroy = true
}
