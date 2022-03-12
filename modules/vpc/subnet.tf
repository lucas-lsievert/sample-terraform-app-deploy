resource "aws_subnet" "public_subnet" {
    vpc_id     = aws_vpc.this.id
    cidr_block = var.public_cidr_block

    tags = {
      Name = "sample Public Subnet"
    }
}

resource "aws_subnet" "private_subnet" {
    vpc_id     = aws_vpc.this.id
    cidr_block = var.private_cidr_block

    tags = {
      Name = "sample Private Route"
    }  
}