provider "aws" {
  region     = "ca-central-1"
  access_key = "AKIAUEIZJ3ZOOIWF2WRQ"
  secret_key = "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"
}

 resource "aws_vpc" "development-vpc" {
     cidr_block = "10.0.0.0/16"
 }

resource "aws_subnet" "dev-subnet-1" {
    vpc_id = aws_vpc.development-vpc.id
    cidr_block = "10.0.10.0/24"
    availability_zone = "ca-central-1b"
}