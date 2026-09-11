output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.vpc.public_subnet_id
}

output "prive_subnet_id" {
  value = module.vpc.prive_subnet_id
}

output "eip_public_ip" {
  value = module.network.eip_public_ip
}

output "nat_gateway_id" {
  value = module.network.nat_gateway_id
}

output "sg_bastion_id" {
  value = module.security.sg_bastion_id
}

output "sg_prive_id" {
  value = module.security.sg_prive_id
}