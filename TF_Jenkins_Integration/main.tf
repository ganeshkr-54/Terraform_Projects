resource "aws_instance" "my-vm" {
    ami= var.ami 
    instance_type = var.instance_type
    tags = {
      name = "my-vm"
    }

}

resource "aws_instance" "my_vm" {
 ami           = var.ami //Ubuntu AMI
 instance_type = var.instance_type

 tags = {
   Name = var.name_tag,
 }
}
