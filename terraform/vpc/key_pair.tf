resource "aws_key_pair" "key" {
  key_name_prefix = "${terraform.workspace}-key-"
  public_key      = "${file("./key_pair.pub")}"
}
