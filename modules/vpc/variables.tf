variable "poste_nn" {
  description = "Numero de poste, ex: 08"
  type        = string
}

variable "vpc_cidr" {
  description = "Plage CIDR du VPC"
  type        = string
  default     = "10.0.0.0/16"
}