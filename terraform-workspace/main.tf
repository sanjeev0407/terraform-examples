# Create a new host with instance type of t2.micro with Auto Placement and Host Recovery enabled.

resource "aws_instance" "first-tfserver" {
  ami           = var.aws_ami
  instance_type = var.instance_type["dev"]

  count = var.instance_count
  
  tags = {
    Name = "webserver"
  }

}

/*
Terraform Workspace:
Terraform Workspace help you keeping your infrastructure consistent and use a single manifest to create many of the same things again and again. 
Working with Terraform involves managing collections of infrastructure resources.


Terraform workspace -h	        Terraform help
Terraform workspace new [name]	Creation of workspace
Terraform workspace delete	    delete workspace
Terraform workspace list	      list workspace
Terraform workspace select   	  select workspace (switching to another workspace)
Terraform workspace show   	    Show name of the current workspace

while Initializing the backend.it's creating terraform.tfstate.d folder of each environment.
Based use cases it's stroing terraform.tfstate and terraform.tfstate.backup files
*/