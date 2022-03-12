output "private_subnet_id" {
    description = "Private Subnet ID"
    value       = aws_subnet.private_subnet.id
}

output "public_subnet_id" {
    description = "Public Subnet ID"
    value       = aws_subnet.public_subnet.id
}

output "vpc_id" {
    description = "ID of the created VPC"
    value       = aws_vpc.this.id
}