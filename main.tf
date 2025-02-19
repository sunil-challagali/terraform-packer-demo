provider "aws" {
  region = "ap-south-1"
}

# Replace this with the AMI ID that Packer generated (you can get it from the output or the Packer manifest file)
variable "ami_id" {
  description = "The AMI ID of the custom AMI created by Packer"
  type        = string
}
data "aws_ami" "latest" {
  most_recent = true
  owners      = ["self"]
  filter {
    name   = "name"
    values = ["my-custom-ami*"]
  }
}
resource "aws_instance" "packer" {
  ami           = var.ami_id  # Use the AMI ID from the variable
  instance_type = "t2.micro"
  key_name      = "dockernew"  # Replace with your SSH key name
  depends_on = [aws_ami.custom_ami]
  tags = {
    Name = "MyInstance"
  }
}

output "instance_id" {
  value = aws_instance.packer.id
}
