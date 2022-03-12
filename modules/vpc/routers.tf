resource "aws_route_table" "public_route" {
    vpc_id = aws_vpc.this.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.this.id
    }

    tags = {
      Name = "sample Public Route"
    }
}

resource "aws_route_table" "private_route" {
    vpc_id = aws_vpc.this.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.this.id
    }

    tags = {
      Name = "sample Private Route"
    }
}

resource "aws_route_table_association" "public_subnet" {
    subnet_id      = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.public_route.id
}

resource "aws_route_table_association" "private_subnet" {
    subnet_id      = aws_subnet.private_subnet.id
    route_table_id = aws_route_table.private_route.id
}