output "igw_id" {
  value = aws_internet_gateway.this.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.this.id
}

output "eip_public_ip" {
  value = aws_eip.nat.public_ip
}

output "rt_public_id" {
  value = aws_route_table.public.id
}

output "rt_prive_id" {
  value = aws_route_table.prive.id
}