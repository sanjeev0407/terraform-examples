variable "aws_region" {
  description = "selecting aws region"
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "type of instance"
  default     = "t2.micro"
}

variable "aws_ami" {
  description = "Update with valid AMI ID for ap-south-1 region"
  default     = "ami-026255a2746f88074"
}
