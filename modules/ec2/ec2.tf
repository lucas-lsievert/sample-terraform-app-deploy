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

  owners = ["amazon"]
}

resource "aws_instance" "this" {
    ami                    = data.aws_ami.amazon-linux-2.id
    instance_type          = var.instance_type
    subnet_id              = var.subnet_id
    vpc_security_group_ids = [aws_security_group.this.id]

    tags = {
        Name = "Sample Application"
    } 
}