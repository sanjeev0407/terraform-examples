# Creating module of EC2

module "ec2module" {
  source = "../../modules/ec2"
    instance_type =  "t2.medium"
}

