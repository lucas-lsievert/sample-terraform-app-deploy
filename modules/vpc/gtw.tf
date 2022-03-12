resource "aws_eip" "this" {
    vpc = true

    tags = {
        Name = "sample_eip"
    }
}

resource "aws_internet_gateway" "this" {
    vpc_id = aws_vpc.this.id

    tags = {
        Name = "sample_Internet_GTW"
    }
}

resource "aws_nat_gateway" "this" {
    allocation_id = aws_eip.this.id
    subnet_id     = aws_subnet.private_subnet.id

    tags = {
      Name = "sample_Nat_GTW"
    }

    depends_on    = [aws_internet_gateway.this]
}