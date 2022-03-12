# sample-terraform-app-deploy

This sample terraform project create a basic VPC infrastructure using AWS cloud and deploy a sample webapp inside an EC2 instance.

## Preriquisites
1. Install terraform (v1.0.0 or later)
2. Install Git
3. AWS credentials to allow terraform create resources (Current Supported Way: Access and Secret Key). User Policy example is available inside 'sample-user-permission.json' file.

## Terraform Structure

1. Module VPC - This module is responsible to create all resources related to AWS VPC(VPC, Subnets, Route Table, Gateways). The CIDR range assign to the vpc and subnets could be changed using the proper variables. 
2. Module Ec2 - This module is responsible to create the application ec2, security group and configure the userdata used to configure the instance with the sample application.

## How to Use

1. Clone the IAC github repository - https://github.com/lucas-lsievert/sample-terraform-app-deploy.git
2. Run terraform init to setup the terraform backend - `terraform init`
3. Apply terraform passing secret and access key as variables - `terraform apply -var 'access_key=****' -var 'secret_key=****'`
   Replace the variable values with your own credentials
4. Run terraform output to grab the public ip from the app instance = `terraform output app_instance_ip`
5. Wait about four or five minutes after terraform ends the execution. This script uses the userdata from ec2 to configure the instance, it take some time.
6. Use the public ip in your browser to see the message from the webapp hosted inside the ec2 instance.

## Terraform Defaults

- vpc_cidr_block     - 10.0.0.0/16
- public_cidr_block  - 10.0.1.0/24
- private_cidr_block - 10.0.2.0/24
- instance_type      - t2.micro
- image_id           - Amazon Linux 2
- Terraform Backend  - local folder
- region             - us-east-1

The cidr blocks, instance type and default region can be changed using variables - Ex: `terraform apply -var 'private_cidr_block=10.0.3.0/24'`
Caution: If you change any cidr block, take care that the configuration is still valid.

## Terraform Backend

By default, the backend is stored inside local folder. You can change this add other backend inside main.tf file in the root folder or simple using flags during terraform init.

Ex: `terraform init -backend-config=bucket=BUCKET_NAME - backend-config=key=KEY_NAME -backend-config=region=REGION_NAME -backend-config=access_key=ACCESS_KEY -backend-config=secret_key=SECRET_KEY`

