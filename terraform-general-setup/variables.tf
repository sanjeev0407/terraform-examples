variable "aws_region" {
  description = "selecting aws region"
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "type of instance"
  default     = "t2.micro"
}

variable "instance_count" {
  description = "no.of instance"
  default     = 1
}

variable "aws_ami" {
  description = "Update with valid AMI ID for ap-south-1 region"
  default     = "ami-026255a2746f88074"
}

variable "userdata_file_path" {
  default = "userdata-nginx.bash"
}

/* Discussing on variable types of list,map, number
variable "instance_type" {
  description = "type of instance"
  type = list(string)
  default     = ["t2.micro", "t2.nano", "t2.micro"]
}
# variable list;   instance_type = var.instance_type[1] ----> you can mention in main.tf file

#Discussing on variable Map:
variable "instance_type" {
  description = "type of instance"
  type = map(string)
  default     = {
    "dev" = "t2.micro", 
    "QA" = "t2.nano", 
    "test"  = "t2.micro"
    }
}
instance_type = var.instance_type["dev"] ----> you can mention in main.tf file
*/
