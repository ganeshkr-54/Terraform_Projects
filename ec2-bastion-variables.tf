# ec2 bashion variables

variable "instance_type" {
    description = "ec2 instance type"
    type = string
    default = "t3.micro"
  
}

variable "instance_keypair" {
    description = "keypair which is associated with ec2 instance"
    type = string
    default = "eks-terraform"
  
}