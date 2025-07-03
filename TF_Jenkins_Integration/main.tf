resource "aws_instance" "my-vm" {
    ami= var.ami 
    instance_type = var.instance_type
    tags = {
      name = "my-vm"
    }

}

