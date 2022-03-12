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
}