resource "aws_key_pair" "this" {
  key_name   = "tp-${var.poste_nn}-cle"
  public_key = file(var.public_key_path)
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

resource "aws_instance" "bastion" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = "t3.micro"
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [var.sg_bastion_id]
  key_name                    = aws_key_pair.this.key_name
  associate_public_ip_address = true

  tags = {
    Name = "tp-${var.poste_nn}-bastion"
  }
}

resource "aws_instance" "app" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = "t3.micro"
  subnet_id                   = var.prive_subnet_id
  vpc_security_group_ids      = [var.sg_prive_id]
  key_name                    = aws_key_pair.this.key_name
  associate_public_ip_address = false

  tags = {
    Name = "tp-${var.poste_nn}-app"
  }
}