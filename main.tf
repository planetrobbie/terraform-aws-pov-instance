# Using a single workspace:
terraform {
  backend "remote" {
    hostname     = "replicated.yet.org"
    organization = "yet"

    workspaces {
      name = "terraform-aws-pov-instance"
    }
  }
}

provider aws {
  region  = "${var.aws_region}"
  version = "~> 1.50"
}

data "terraform_remote_state" "vpc" {
  backend = "atlas"

  config {
    name    = "yet/terraform-aws-vpc"
    address = "https://replicated.yet.org"
  }
}

resource "aws_instance" "pov_instance" {
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"

  subnet_id = "${element(data.terraform_remote_state.vpc.private_subnets, 0)}"

  tags {
    Name         = "${var.instance_tag}"
    BusinessUnit = "${var.business_unit}"
  }
}
