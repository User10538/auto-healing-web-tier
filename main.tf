module "network" {
  source = "./modules/network"

  name_prefix        = local.name_prefix
  vpc_cidr           = var.vpc_cidr
  availability_zones = var.availability_zones
  public_subnets     = var.public_subnets
}

module "web_tier" {
  source = "./modules/web_tier"

  name_prefix   = local.name_prefix
  vpc_id        = module.network.vpc_id
  subnet_ids    = module.network.public_subnet_ids
  instance_type = var.instance_type
  min_size      = var.min_size
  desired_size  = var.desired_size
  max_size      = var.max_size
  health_path   = var.health_path
}
