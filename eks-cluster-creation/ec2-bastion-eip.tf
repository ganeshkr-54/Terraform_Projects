# Create Elastic IP for Bastion Host

resource "aws_eip" "bastion_eip" {
    instance = module.ec2-public.id
    depends_on = [ module.ec2-public, module.vpc ]
    domain = "vpc"
    tags = local.common_tags
  
}