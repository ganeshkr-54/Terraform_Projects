####################################################################
#
#
#
####################################################################

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.98.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

output "NodeInstanceRole" {
  value = aws_iam_role.node_instance_role.arn
}

output "NodeSecurityGroup" {
  value = aws_security_group.node_security_group.id
}

output "NodeAutoScalingGroup" {
  value = aws_cloudformation_stack.autoscaling_group.outputs["NodeAutoScalingGroup"]
}