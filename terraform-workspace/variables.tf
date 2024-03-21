variable "aws_region" {
  description = "selecting aws region"
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "type of instance"
  type = map(string)
  default     = {
    "dev" = "t2.micro", 
    "QA" = "t2.nano", 
    "test"  = "t2.micro"
    }
}

variable "instance_count" {
  description = "no.of instance"
  default     = 1
}

variable "aws_ami" {
  description = "Update with valid AMI ID for ap-south-1 region"
  default     = "ami-026255a2746f88074"
}
