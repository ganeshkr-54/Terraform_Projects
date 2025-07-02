variable "ami" {
    type = string
    description = "ami of vm"
    default = "ami-020cba7c55df1f615"
  
}

variable "instance_type" {
    type = string
    description = "value of instanace type"
    default = "t2.micro"
  
}

variable "name_tag" {
   type        = string
   description = "Name of the EC2 instance"
   default     = "My EC2 Instance"
}