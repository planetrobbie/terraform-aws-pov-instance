variable "aws_region" {
  description = "the region where our PoV instance will be deployed"
  type        = "string"
  default     = "eu-west-3"
}

variable "instance_type" {
  description = "The type of EC2 Instance to deploy"
  type        = "string"
  default     = "t2.micro"
}

variable "instance_tag" {
  description = "Instance Tag"
  type        = "string"
  default     = "pov-instance"
}

variable "ami_id" {
  description = "Instance AMI"
  type        = "string"
  default     = "ami-38a01045"
}