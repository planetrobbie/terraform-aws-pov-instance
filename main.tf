provider aws {
  region     = "${var.aws_region}"
  version    = "~> 1.50"
}

data "terraform_remote_state" "vpc" {
  backend = "atlas"
  config {
    name = "yet/terraform-aws-vpc"
    address = "https://replicated.yet.org"
  }
}

resource "aws_instance" "pov_instance" {
  ami               = "${var.ami_id}"
  instance_type     = "${var.instance_type}"

  subnet_id         = "${data.terraform_remote_state.vpc.vpc_id}"

  tags {
    Name = "${var.instance_tag}"
  }
}