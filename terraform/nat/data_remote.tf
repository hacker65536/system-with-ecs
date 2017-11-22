data "terraform_remote_state" "rst" {
  backend = "s3"

  config {
    bucket = "${terraform.workspace}-remote-state-bucket"
    key    = "env:/${terraform.workspace}/vpc"
    region = "${data.aws_region.current.name}"
  }
}
