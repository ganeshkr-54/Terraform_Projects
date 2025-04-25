data "aws_availability_zones" "available" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws/"
  version = "5.21.0"

# VPC basic details
  name = local.eks_cluster_name
  cidr = var.vpc_cidr_block

  azs                 = data.aws_availability_zones.available.name
  private_subnets     = var.vpc_private_subnets
  public_subnets      = var.vpc_public_subnets
  database_subnets    = var.vpc_database_subnets

}