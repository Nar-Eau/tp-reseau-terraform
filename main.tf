module "vpc" {
  source   = "./modules/vpc"
  poste_nn = var.poste_nn
}