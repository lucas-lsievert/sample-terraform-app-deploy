resource "aws_eip" "this" {
    vpc = true
}

resource "aws_internet_gateway" "this" {
    vpc_id = aws_vpc.this.id
}

resource "aws_nat_gateway" "this" {
    allocation_id = aws_eip.this.id
    subnet_id     = aws_subnet.private_subnet.id

    depends_on    = [aws_internet_gateway.this]
}