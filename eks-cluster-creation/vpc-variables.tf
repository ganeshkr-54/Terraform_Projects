# VPC input variables 

# vpc name
variable "vpc_name" {
    description = "vpc name"
    type = string
    default = "myvpc"
  
}
# vpc cidr bloc
variable "vpc_cidr_block" {
    description = "vpc ip cidr block"
    type = string
    default = "10.0.0.0/16"
  
}

variable "vpc_private_subnets" {
    description = "private subnet range"
    type = list(string)
    default =  ["10.0.1.0/24", "10.0.2.0/24"]  
}

variable "vpc_public_subnets" {
    description = "public subnet range"
    type = list(string)
    default =  ["10.0.101.0/24", "10.0.102.0/24"]   
}

variable "vpc_database_subnets" {
    description = "database subnet range"
    type = list(string)
    default =  ["10.0.151.0/24", "10.0.151.0/24"]   
}

variable "vpc_create_database_subnet_group" {
    description = "database subnet group"
    type = bool
    default =  true 
}
variable "vpc_create_database_subnet_route_table" {
  description = "VPC Create Database Subnet Route Table"
  type = bool
  default = true   
}



variable "vpc_single_nat_gateway" {
    description = "we enable single nat gateway to create only one nat gateway per availability zone "
    type = bool
    default =  true 
  
}

variable "vpc_enable_nat_gateway" {
    description = "we enable nat gateway to get public communication to api server from private worker nodes"
    type = bool
    default =  true 
  
}
