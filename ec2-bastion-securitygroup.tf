module "public_bastion_sg" {
    source = "terraform-aws-modules/security-group/aws"
    version = "5.3.0"
    name = "${local.name}-ec2-bastion-sg"
    description = "security group with ssh port open to internet"
    vpc_id = module.vpc.vpc_id

    # ingress rules
    ingress_rules = ["ssh-tcp"]
    ingress_cidr_blocks = ["0.0.0.0/0"]

    # egress rules
    egress_rules = ["all-all"]
    tags = local.common_tags
}