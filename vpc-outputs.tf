# vpc output values we get on the screan after it is created

output "vpc_id" {
    description = "vpc id"
    value = module.vpc.vpc_id  
}

output "vpc_cidr_block" {
    description = "ip cidr of vpc"
    value = module.vpc.vpc_cidr_block
  
}

output "private_subnets" {
    description = "list of private subnet ids"
    value = module.vpc.private_subnets
  
}
output "public_subnets" {
    description = "list of public subnet ids"
    value = module.vpc.public_subnets
  
}
output "database_subnets" {
    description = "list of database subnet ids"
    value = module.vpc.database_subnets
  
}

output "azs" {
    description = "availability zones where resources can be created"
    value = module.vpc.azs
  
}