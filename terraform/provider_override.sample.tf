provider "aws" {
  version = "~> 1.0"
  region  = "ap-northeast-1"
  profile = "default"

  assume_role {
    role_arn     = "arn:aws:iam::000000000000:role/ASSUMEROLE"
    session_name = "sessionname"
  }
}

provider "aws" {
  alias   = "west"
  region  = "us-west-2"
  profile = "default"

  assume_role {
    role_arn     = "arn:aws:iam::000000000000:role/ASSUMEROLE"
    session_name = "sessionname"
  }
}
