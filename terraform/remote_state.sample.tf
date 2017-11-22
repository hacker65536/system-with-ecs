terraform {
  required_version = "~> 0.11.0"

  backend "s3" {
    bucket = "<my_s3bucket>-remote-state-bucket"
    region = "us-west-2"

    # role_arn = ""
    # profile  = ""

    # key =""
    # or terraform init -backend-config="key=keyname"
  }
}

#data "terraform_remote_state" "rst" {
#  backend = "s3"
#
#  config {
#    bucket = ""
#    key    = ""
#    region = ""
#
#    role_arn = ""
#    profile  = ""
#  }
#}

