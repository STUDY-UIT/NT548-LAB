variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "ap-southeast-1"
}

variable "project_name" {
  description = "Project name used as prefix for all resources"
  type        = string
  default     = "nt548-lab1"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for Public Subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for Private Subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "az" {
  description = "Availability Zone"
  type        = string
  default     = "ap-southeast-1a"
}

variable "my_ip" {
  description = "Your Public IP address for SSH access (without /32)"
  type        = string
  default     = "0.0.0.0/24"
}

variable "ami_id" {
  description = "Amazon Linux 2023 kernel-6.1 AMI"
  type        = string
  default     = "ami-03c3282f979a6a9b0"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" { // chưa biết có dùng key pair để SSH hay không?
  description = "Name of existing EC2 Key Pair for SSH access"
  type        = string
  default     = "NT548-LAB-KEYPAIR"
}

# variable "aws_access_key" {
#   type = string
# }

# variable "aws_secret_key" {
#   type = string
# }