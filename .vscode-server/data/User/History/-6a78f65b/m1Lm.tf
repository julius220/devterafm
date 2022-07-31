provider "aws" {
  region     = "ca-central-1"
  access_key = "AKIAUEIZJ3ZOOIWF2WRQ"
  secret_key = "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"
}

 resource "aws_vpc" "development-vpc" {
     cidr_block = "10.0.0.0/16"
     tags = {
        Name: "development"
        vpc_env: "dev"
     }
 }

resource "aws_subnet" "dev-subnet-1" {
    vpc_id = aws_vpc.development-vpc.id
    cidr_block = "10.0.10.0/24"
    availability_zone = "ca-central-1b"
     tags = {
        Name: "subnet1-dev"
     }
}

data "aws_vpc" "existing_vpc" {
    default = true
}
   
resource "aws_subnet" "dev-subnet-2" {
    vpc_id = data.aws_vpc.existing_vpc.id
    cidr_block = "172.31.48.0/20"
    availability_zone = "ca-central-1b"
     tags = {
        Name: "default-subenet"
     }
}