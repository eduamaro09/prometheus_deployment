provider "aws" {
    region = "us-east-1"
    access_key = ""
    secret_key = ""

}
# Create  a vpc
resource "aws_vpc" "prometheus_vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Project = "PITA"
        Environment = "Dev"
    }
  
}
# Create internet gateway
resource "aws_internet_gateway" "prometheus_ig" {
    vpc_id = aws_vpc.prometheus_vpc.id
    tags = {
      "Project" = "PITA",
      "Environment" = "Dev"
    }
  
}
# Create custome route table

resource "aws_resource" "name" {
  
}
# Create a subnet
# Associate subnet with Route table
# Create security group (all in one prometheus)
# Create a network interface with an ip in the subnet for ec2
# Assing a elastic IP to the network interface
# Create a ubuntu server




