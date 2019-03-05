output "public_dns" {
  value = "${aws_instance.pov_instance.public_dns}"
}
