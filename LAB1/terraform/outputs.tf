output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "public_ec2_ip" {
  description = "Public IP of Public EC2 instance (dùng để SSH vào)"
  value       = module.ec2.public_instance_ip
}

output "private_ec2_ip" {
  description = "Private IP of Private EC2 instance"
  value       = module.ec2.private_instance_ip
}

output "nat_gateway_id" {
  description = "NAT Gateway ID"
  value       = module.nat_gateway.nat_gateway_id
}