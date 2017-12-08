data "terraform_remote_state" "vpc" {
  backend = "s3"

  config {
    bucket = "${local.remote_state_bucket}"
    key    = "env:/${terraform.workspace}/vpc"
    region = "${local.remote_state_bucket_region}"
  }
}
