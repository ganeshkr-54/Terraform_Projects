# AWS EC2 instance module
# ec2 bastion instance that would creating in myvpc and can be connected to worked nodes

module "ec2-public" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "5.8.0"
  name                   = "${local.name}-BastionHost"
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  ami                    = data.aws_ami.amzlinux2.id
  availability_zone      = module.vpc.azs
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.public_bastion_sg.security_group_ids]
  tags                   = local.common_tags
}
