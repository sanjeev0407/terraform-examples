# Create a new host with instance type of t2.micro with Auto Placement and Host Recovery enabled.

resource "aws_instance" "first-tfserver" {
  ami           = var.aws_ami
  instance_type = local.instance_type

  tags = {

    Name = "WEBserver-1"
  }

}

# if you don't want overwrite instance type in modules, you can use locals; it's prevent the overwritten file.
# you can write separate local file or after resource block you can use it.
 locals {
    instance_type = "t2.micro"
  }
