provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "packer" {
  ami           = "ami-00bb6a80f01f03502" # Replace with your built AMI ID
  instance_type = "t2.micro"
}

output "instance_id" {
  value = aws_instance.packer.id
}
