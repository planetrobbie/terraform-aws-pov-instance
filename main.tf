provider aws {
  region     = "${var.aws_region}"
  version    = "~> 1.50"
}

resource "aws_instance" "pov_instance" {
  ami               = "${var.ami_id}"
  instance_type     = "${var.instance_type}"
  availability_zone = "${var.aws_region}"

  subnet_id         = "subnet-03d9b5176be0f546b"

  tags {
    Name = "${var.instance_tag}"
  }
}