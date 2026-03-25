resource "aws_vpc_peering_connection" "peering" {
  peer_vpc_id = aws_vpc.ldap.id
  vpc_id      = aws_vpc.web.id
  auto_accept = true
  tags = { Name = "peering-web-ldap" }
}