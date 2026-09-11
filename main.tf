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