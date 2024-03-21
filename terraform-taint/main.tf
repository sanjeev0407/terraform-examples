# Create a new host with instance type of t2.micro with Auto Placement and Host Recovery enabled.

resource "aws_instance" "first-tfserver" {
  ami           = var.aws_ami
  instance_type = var.instance_type
  user_data     = templatefile("userdata-httpd.tmpl", {package_name = var.package_name})
  tags = {

    Name = "WEBserver-1"
  }

}

# resource "aws_instance" "second-tfserver" {
#   ami           = var.aws_ami
#   instance_type = var.instance_type 

#   tags = {
#     Name = "WEBserver-2"
#   }

# }

/*
Terraform Taint:
•	The terraform taint command informs Terraform that a particular object has become degraded or damaged.
•	The terraform taint command manually marks a Terraform-managed resource as tainted, forcing it to be destroyed and recreated on the next apply.

Use Cases:
•	It could use for re-creating an EC2 instance if someone logged in and made some manual changes.
•	Marking a resource as Taint, force a rebuild of certain resources without doing a full destroy - though usually only during development phase.

Behavior:
•	This command will not modify infrastructure, but does modify the state file in order to mark a resource as tainted.
•	Once a resource is marked as tainted, the next plan will show that the resource will be destroyed and recreated and the next apply will implement this change.

terraform taint aws_instance.first-tfserver
terraform untaint aws_instance.first-tfserver

*/