provider "aws" {
    region = "us-east-1"
    access_key = ""
    secret_key = ""

}
# Create  a vpc
resource "aws_vpc" "prometheus_vpc" {
    cidr_block = "10.0.0.0/24"
    tags = {
        Name = "prometheus_vpc"
        Project = "PITA"
        Environment = "Dev"
    }
  
}
# Create internet gateway
resource "aws_internet_gateway" "prometheus_ig" {
    vpc_id = aws_vpc.prometheus_vpc.id
    tags = {
        "Name" = "prometheus_vpc",
        "Project" = "PITA",
        "Environment" = "Dev"
    }
  
}
# Create custome route table
resource "aws_route_table" "prometheus_route" {
  vpc_id = aws_vpc.prometheus_vpc.id
  route = [
    {
      cidr_block = "10.0.1.0/24"
      gateway_id = aws_internet_gateway.prometheus_ig.id
      carrier_gateway_id = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id = ""
      instance_id = ""
      ipv6_cidr_block = ""
      local_gateway_id = ""
      nat_gateway_id = ""
      network_interface_id = ""
      transit_gateway_id = ""
      vpc_endpoint_id = ""
      vpc_peering_connection_id = ""
    }
    # {
    #   ipv6_cidr_block        = "::/0"
    #   egress_only_gateway_id = aws_internet_gateway.prometheus_ig.id
    #   carrier_gateway_id = ""
    #   destination_prefix_list_id = ""
    #   egress_only_gateway_id = ""
    #   instance_id = ""
    #   local_gateway_id = ""
    #   nat_gateway_id = ""
    #   network_interface_id = ""
    #   transit_gateway_id = ""
    #   vpc_endpoint_id = ""
    #   vpc_peering_connection_id = ""
    #         cidr_block = "10.0.1.0/24"

    # }
  ]

  tags = {
    Name = "prometheus_route"
  }
}
  
# Create a subnet
resource "aws_subnet" "prometheus_subnet" {
    vpc_id = aws_vpc.prometheus_vpc.id
    cidr_block = "10.0.1.0/24"

    tags = {
      "Name" = "prometheus_subnet"

    }
  
}
# Associate subnet with Route table
# Create security group (all in one prometheus)
# Create a network interface with an ip in the subnet for ec2
# Assing a elastic IP to the network interface
# Create a ubuntu server




