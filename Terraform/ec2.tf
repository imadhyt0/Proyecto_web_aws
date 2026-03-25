resource "aws_key_pair" "imad" {
  key_name   = var.key_name
  public_key = file("C:/Users/Administrador/.ssh/imad-key.pub")
}

resource "aws_instance" "web" {
  ami                         = "ami-0c02fb55956c7d316" # Amazon Linux 2
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.imad.key_name
  subnet_id                   = aws_subnet.web_publica.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.web_sg.id]

  user_data = file("setup_web.sh")

  tags = { Name = "web-ec2" }
}

resource "aws_instance" "ldap" {
  ami                         = "ami-0c02fb55956c7d316" # Amazon Linux 2
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.imad.key_name
  subnet_id                   = aws_subnet.ldap_privada.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.ldap_sg.id]

  user_data = file("setup_ldap.sh")

  tags = { Name = "ldap-ec2" }
}

output "web_public_ip" {
  value = aws_instance.web.public_ip
}
output "ldap_private_ip" {
  value = aws_instance.ldap.private_ip
}