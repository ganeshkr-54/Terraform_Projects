data "aws_availability_zones" "available" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.21.0"

# VPC basic details
  name = local.eks_cluster_name
  cidr = var.vpc_cidr_block

  azs                 = data.aws_availability_zones.available.names
  private_subnets     = var.vpc_private_subnets
  public_subnets      = var.vpc_public_subnets

  # Database componentes
  database_subnets    = var.vpc_database_subnets
  create_database_subnet_group = var.vpc_create_database_subnet_group
  create_database_subnet_route_table = var.vpc_create_database_subnet_route_table

  # Nat Gateway for outbound connection
  enable_nat_gateway = var.vpc_enable_nat_gateway
  single_nat_gateway = var.vpc_single_nat_gateway

# VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support   = true

# Tags

vpc_tags = local.common_tags

 # Additional Tags to Subnets
  public_subnet_tags = {
    Type = "Public Subnets"
    "kubernetes.io/role/elb" = 1    
    "kubernetes.io/cluster/${local.eks_cluster_name}" = "shared"        
  }
  map_public_ip_on_launch = true
}