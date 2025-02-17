provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-xxxxxxxx" # Replace with your built AMI ID
  instance_type = "t2.micro"
}

output "instance_id" {
  value = aws_instance.example.id
}
