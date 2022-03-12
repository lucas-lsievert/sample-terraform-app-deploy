terraform {
    required_providers {
        aws = {
            source  = "hashcorp/aws"
            version = "~> 3.0"
        }
    }
}

provider "aws" {
    region     = var.aws_region
    access_key = var.access_key
    secret_key = var.secret_key
}

module "vpc" {
    source = "modules/vpc/"

    vpc_cidr_block     = var.vpc_cidr_block
    public_cidr_block  = var.public_cidr_block
    private_cidr_block = var.private_cidr_block
}