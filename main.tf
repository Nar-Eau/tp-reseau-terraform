module "vpc" {
  source   = "./modules/vpc"
  poste_nn = var.poste_nn
}

module "network" {
  source            = "./modules/network"
  poste_nn          = var.poste_nn
  vpc_id            = module.vpc.vpc_id
  public_subnet_id  = module.vpc.public_subnet_id
  prive_subnet_id   = module.vpc.prive_subnet_id
}

module "security" {
  source           = "./modules/security"
  poste_nn         = var.poste_nn
  vpc_id           = module.vpc.vpc_id
  mon_ip_publique  = var.mon_ip_publique
}

module "compute" {
  source            = "./modules/compute"
  poste_nn          = var.poste_nn
  public_subnet_id  = module.vpc.public_subnet_id
  prive_subnet_id   = module.vpc.prive_subnet_id
  sg_bastion_id     = module.security.sg_bastion_id
  sg_prive_id       = module.security.sg_prive_id
  public_key_path   = var.public_key_path
}