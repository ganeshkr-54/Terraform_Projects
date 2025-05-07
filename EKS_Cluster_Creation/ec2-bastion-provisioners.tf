# Create Null Resourse and Provisioners
resource "null_resource" "copy-ec2-keys" {
    depends_on = [module.ec2-public]
# Connection Block to connect to ec2 instance
connection {
  type = "ssh"
  host = aws_eip.bastion_eip.public_ip
  user = "ec2-user"
  password = ""
  private_key = file("private-key/eks-terraform.pem")

}  

# file provisioners copies ssh pem key file to /tmp/eks-terraform.pem
   provisioner "file" {
    source = "private-key/eks-terraform.pem"
    destination = "/tmp/eks-terraform.pem"
     
   }
# remote provisioners to run any commands or scripts in remote resources
   provisioner "remote-exec" {
    inline = [ "sudo chmod 400 /tmp/eks-terraform.pem" ]
     
   }
# local provisioners to run any commands or scripts in local machine
   provisioner "local-exec" {
   command = "echo VPC created on `date` and VPC ID: ${module.vpc.vpc_id} >> creation-time-vpc-id.txt"
   working_dir = "local-exec-output-files/"
   }
    }
  
