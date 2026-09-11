output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "prive_subnet_id" {
  value = aws_subnet.prive.id
}