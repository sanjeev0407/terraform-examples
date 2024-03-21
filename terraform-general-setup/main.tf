# Create a new host with instance type of t2.micro with Auto Placement and Host Recovery enabled.

resource "aws_instance" "first-tfserver" {
  ami           = var.aws_ami
  instance_type = var.instance_type 
  # instance_type = var.instance_type[1]  # Example: Using the second instance type from a list

 # availability_zone = "ap-south-1a"

  availability_zone = "ap-south-1b"

  count = var.instance_count
  
  user_data = file(var.userdata_file_path)

  tags = {
    Name = "First_TF_server-${count.index}"
  }

}

/*
# some samples generated here
Set environment variable:
Terraform searches the environment of its own process for environment variables named TF_VAR_ followed by the name of a declared variable.
$ export AWS_ACCESS_KEY_ID="anaccesskey"
$ export AWS_SECRET_ACCESS_KEY="asecretkey"
$ export AWS_DEFAULT_REGION="us-west-2"
$ export TF_VAR_image_id=ami-abc123

$ terraform plan

Method-2: how to store aws credentials in commandPromt or powershell use below command
aws configure
access_key = "my-access-key"
secret_key = "my-secret-key"
region     = "us-west-2"


it is asking access, secret key region you can enter; 
before that you can create one user and generate accesskey and secret from IAM AWS.



# storing tfstate file in s3 bucket but s3 is not supporting for lockig function ; DynamoDB supported.
terraform {
  backend "s3" {
    bucket = "tf-state-file-storing" # create bucket name as tf-state-file as your wish
    key    = "sample/terraform.tfstate" #create folder name as sample
    region = "ap-south-1"
    #dynamodb-table = "teraform-state-lockingfile"
  }
}



#Create s3 buckets in diff environments by using for_each
resource "aws_s3_bucket" "mys3perenv" {
  for_each = {
    "dev"  = "dev-s3-bucket-00741"
    "qa"   = "qa-s3-bucket-00741"
    "prod" = "prod-s3-bucket-00741"
  }

  bucket = "${each.key}-${each.value}"
  acl    = "private"

  tags = {
    value          = each.value
    env            = each.key
    s3-bucket-name = "${each.key}-${each.value}"
  }
}

#Creation of multiple IAM user with for_each (set of strings => toset)
resource "aws_iam_user" "iamuser" {
for_each = toset (["ASanjeevKumar", "ManvithGupta", "RKumar", "UmeshSingh"])
name = each.key
#name=each.value
}

# this is single line comment and // also 
# /*  end  Multiline comment */

/*
resource "aws_eip" "lb" {
  instance = aws_instance.first-tfserver.id
  vpc= true
  depends_on =[
    aws_internet_gateway.vpc-dev-igw
  ]
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.first-tfserver.id
  allocation_id = aws_eip.lb.id
}

#Resource Meta_argumnets-Lifecycles:
resource "aws_instance" "first-tfserver" {
  ami           = var.aws_ami
  instance_type = var.instance_type 
  # instance_type = var.instance_type[1]  # Example: Using the second instance type from a list
 # availability_zone = "ap-south-1a"
  availability_zone = "ap-south-1b"
  count = var.instance_count
  
  user_data = file(var.userdata_file_path)

  tags = {
    Name = "First_TF_server-${count.index}"
  }

  lifecycle {
    create_before_destory = true
  }

 lifecycle {
    ignore_changes = [
    tags,
    ]
 }
   lifecycle {
    prevent_destroy = true
  }

}

# Terraform Data_resource:
data "aws_ami" "amazonami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-*-gp2"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_instance" "ec2" {
  ami           = data.aws_ami.amazonami.id
  instance_type = var.instance_type

  tags = {
    Name = "My-New-Instance"
  }
}

resource "time_sleep" "wait_time_in_sec" {
  create_duration = "100s"
}
*/
/*
What is Terraform
•	Terraform is a tool that helps you create and manage your computer infrastructure, like servers, databases, and networks, in a way that's easy to understand and repeatable.
•	It uses code to define your infrastructure, which means you can treat your infrastructure like software, allowing you to automate its creation and changes.
•	Terraform is an open-source infrastructure, as code software tool that provides a consistent CLI workflow to manage hundreds of cloud services. Terraform codifies cloud APIs into declarative configuration files.

Basic example:
•	Let's say you want to set up a web server on a cloud platform like Amazon Web Services (AWS). 
•	Instead of manually clicking through the AWS console to create the server, you can use Terraform to write a simple configuration file that describes the server's specifications, like its size, operating system, and security settings.
•	By using Terraform, you can automate the provisioning and management of your infrastructure, making it easier to scale, update, and maintain your applications and services.

First EC2 Instance using Terraform:
AWS Account, Terraform Installation
Installation: 
Ref: https://developer.hashicorp.com/terraform/install?product_intent=terraform

verify installation: terraform version

•	We required 3 important things How to Authenticate to AWS.
•	Which region?
•	Resource Type to launch

Basic commands:
•	Terraform init
•	terraform init -upgrade	#if you want upgrade or degrade version
•	Terraform validate 
•	Terraform plan
•	Terraform apply
•	Terraform destroy
•	Terraform apply -refresh-only
•	Terraform apply –auto-approve 	#It will not ask you confirmation before applying
•	aws configure and aws configure list
#If you want delete target resource you can use below command:
terraform destroy -target [resource].[resource Name]
terraform destroy -target github_repository.sample-tf

Terraform Provider:
•	Without provider terraform cannot manage any infrastructure. 
•	Provider are distributed separately from terraform.
•	Each provider has its own release cycles and version number.

*/