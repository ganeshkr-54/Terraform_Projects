# AWS ec2 instance terraform ouputs

output "ec2_bastion_public_instance_ids" {
    description = "list of instance ids"
    value = module.ec2-public.id
  
}

# ec2 public ip
output "ec2_bastion_public_ip" {
    description = "elastic ip associated public ip"
    value = aws_eip.bastion_eip.public_ip
  
}