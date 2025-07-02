output "public_ip" {
    value = aws_instance.my-vm.public_ip
    description = "Public ip of VM"
  
}

output "instance_id" {
    value = aws_instance.my-vm.id
    description = "Id of vm"
  
}