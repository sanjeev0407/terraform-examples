# creating ec2 instance
resource "aws_instance" "ec2" {
  ami           = var.aws_ami
  instance_type = var.instance_type

  tags = {
    Name = "Tf-S3Backend"
  }
}

# storing tfstate file in s3 bucket but s3 is not supporting for lockig function ; DynamoDB supported.
terraform {
  backend "s3" {
    bucket = "tf-state-file-storing" # create bucket name as tf-state-file as your wish
    key    = "sample/terraform.tfstate" #create folder name as sample
    region = "ap-south-1"
    #dynamodb-table = "teraform-state-lockingfile"
  }
}

/*
Terraform state management:
By Default, terraform implicitly uses a backend called local to store state as a local file on disk.
Storing state file in local disk will not allow collaboration.

We cannot store Statefile in central GIT repo, we need to use Central backed like S3 (AWS) or others like consul, Kubernetes, HTTP, ETCD etc.

There is multiple backend supported by terraform.
•	State Management using S3 and DynamoDB
•	By Default, S3 does not support state locking functionality
•	For this we need to make use of DynamoDB to accomplish state locking feature.
•	Accessing state in a remote service generally require some kind of access credentials.


Terraform has detected you're unconfiguring your previously set "s3" backend.
terraform init -migrate-state


*/