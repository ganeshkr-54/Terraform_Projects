# Create Null Resourse and Provisioners
resource "null_resource" "copy-ec2-keys" {
    depends_on = [module.ec2_public]
# Connection Block to connect to ec2 instance
connection {
  type = "ssh"
  host = aws_eip.bastion_eip.public_ip
  user = "ec2-user"
  password = ""
  private_key = file("private_key/eks-terraform-key.pem")

}  

# file provisioners copies ssh pem key file to /tmp/eks-terraform-key.pem
   provisioner "file" {
    source = "private_key/eks-terraform-key.pem"
    destination = "/tmp/eks-terraform-key.pem"
     
   }
# remote provisioners to run any commands or scripts in remote resources
   provisioner "remote-exec" {
    inline = [ "sudo chmod 400 /tmp/eks-terraform-key.pem" ]
     
   }
# local provisioners to run any commands or scripts in local machine
   provisioner "local-exec" {
   command = "echo VPC created on `date` and VPC ID: ${module.vpc.vpc_id} >> creation-time-vpc-id.txt"
   working_dir = "local-exec-output-files/"
   }
    }
  
