resource "aws_security_group" "bastion" {
  name        = "tp-${var.poste_nn}-sg-bastion"
  description = "SG bastion - SSH depuis mon poste uniquement"
  vpc_id      = var.vpc_id

  tags = {
    Name = "tp-${var.poste_nn}-sg-bastion"
  }
}

resource "aws_vpc_security_group_ingress_rule" "bastion_ssh" {
  security_group_id = aws_security_group.bastion.id
  description        = "SSH depuis mon poste"
  from_port           = 22
  to_port              = 22
  ip_protocol          = "tcp"
  cidr_ipv4            = var.mon_ip_publique
}

resource "aws_vpc_security_group_egress_rule" "bastion_all" {
  security_group_id = aws_security_group.bastion.id
  ip_protocol          = "-1"
  cidr_ipv4            = "0.0.0.0/0"
}

resource "aws_security_group" "prive" {
  name        = "tp-${var.poste_nn}-sg-prive"
  description = "SG instance privee - SSH depuis le bastion uniquement"
  vpc_id      = var.vpc_id

  tags = {
    Name = "tp-${var.poste_nn}-sg-prive"
  }
}

resource "aws_vpc_security_group_ingress_rule" "prive_ssh" {
  security_group_id            = aws_security_group.prive.id
  description                    = "SSH depuis le bastion"
  from_port                       = 22
  to_port                          = 22
  ip_protocol                      = "tcp"
  referenced_security_group_id     = aws_security_group.bastion.id
}

resource "aws_vpc_security_group_egress_rule" "prive_all" {
  security_group_id = aws_security_group.prive.id
  ip_protocol          = "-1"
  cidr_ipv4            = "0.0.0.0/0"
}