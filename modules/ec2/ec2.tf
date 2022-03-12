data "aws_ami" "amazon-linux-2" {
  most_recent = true

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
}

resource "aws_instance" "this" {
    ami           = data.aws_ami.amazon-linux-2.id
    instance_type = var.instance_type
    subnet_id     = var.subnet_id

    tags = {
        Name = "Sample Application"
    } 
}