#Access Variables
variable "access_key"{}
variable "secret_key" {}
variable "aws_region" {
    default = "us-east-1"
}



#VPC Variables
variable "vpc_cidr_block" {
    default = "10.0.0.0/16"
}

variable "public_cidr_block" {
    default = "10.0.1.0/24"
}

variable "private_cidr_block" {
    default = "10.0.2.0/24"
}