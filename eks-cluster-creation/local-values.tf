# Define local values in terraform
locals {
  owners = var.business_division
  environment = var.environment
  name = "${var.business_division}-${var.environment}"
  common_tags = {
    owners = local.owners
    name = local.name
  }
  eks_cluster_name = "${local.name}-${var.cluster_name}"
}