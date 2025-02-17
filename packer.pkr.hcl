# Define the builder configuration
source "amazon-ebs" "example" {
  region        = "ap-south-1"
  source_ami    = "ami-00bb6a80f01f03502" # Replace this with a valid source AMI
  instance_type = "t2.micro"
  ssh_username  = "ubuntu"
  ami_name      = "my-custom-ami-{{timestamp}}"
}

# Provisioning step
build {
  provisioner "shell" {
    script = "scripts/setup.sh"
  }

  post-processor "manifest" {
    output = "packer-manifest.json"
  }
}
