variable "aws_region" {
  default = "ap-south-2"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet1_cidr" {
  default = "10.0.1.0/24"
}

variable "public_subnet2_cidr" {
  default = "10.0.2.0/24"
}

variable "ami_id" {
  default = "ami-0aa31b568c1e8d622"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_pair_name" {
  description = "Existing AWS EC2 Key Pair Name"
  type        = string
  default = "hyd-keypair"
}