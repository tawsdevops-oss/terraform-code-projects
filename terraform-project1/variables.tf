variable "aws_region" {
  description = "AWS region"
  default     = "ap-south-2" # Hyderabad Region
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for Public Subnet"
  default     = "10.0.1.0/24"
}

variable "key_name" {
  description = "Name of the key pair"
  default     = "hyd-keypair"
}
