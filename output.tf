output "public_dns" {
  value = "${aws_instance.pov_instance.public_dns}"
}

output "vpc_id" {
  description = "VPC ID where to launch our instance."
  value = "${data.terraform_remote_state.vpc.vpc_id}"
}