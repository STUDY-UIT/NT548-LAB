module "vpc" {
  source = "./modules/vpc"

  project_name        = var.project_name
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  az                  = var.az
}

module "nat_gateway" {
  source = "./modules/nat_gateway"

  project_name     = var.project_name
  public_subnet_id = module.vpc.public_subnet_id
}

module "route_table" {
  source = "./modules/route_table"

  project_name   = var.project_name
  aws_igw_id     = module.vpc.aws_igw_id
  nat_gateway_id = module.nat_gateway.nat_gateway_id
}
module "security_group" {
  source = "./modules/security_group"

  project_name = var.project_name
  vpc_id       = module.network.vpc_id
  my_ip        = var.my_ip
}

module "ec2" {
  source = "./modules/ec2"

  project_name      = var.project_name
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  key_name          = var.key_name
  public_subnet_id  = module.network.public_subnet_id
  private_subnet_id = module.network.private_subnet_id
  public_sg_id      = module.security_group.public_sg_id
  private_sg_id     = module.security_group.private_sg_id
}