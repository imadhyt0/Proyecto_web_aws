# ================= RED WEB =================
resource "aws_subnet" "web_publica" {
  vpc_id                  = aws_vpc.web.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
  tags = { Name = "subnet-publica-web" }
}

resource "aws_internet_gateway" "gw_web" {
  vpc_id = aws_vpc.web.id
  tags = { Name = "igw-web" }
}

resource "aws_route_table" "rt_web" {
  vpc_id = aws_vpc.web.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw_web.id
  }
  route {
    cidr_block                = "10.1.0.0/16"
    vpc_peering_connection_id = aws_vpc_peering_connection.peering.id
  }
  tags = { Name = "rt-publica-web" }
}

resource "aws_route_table_association" "web_assoc" {
  subnet_id      = aws_subnet.web_publica.id
  route_table_id = aws_route_table.rt_web.id
}

# ================= RED LDAP =================
resource "aws_subnet" "ldap_privada" {
  vpc_id                  = aws_vpc.ldap.id
  cidr_block              = "10.1.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
  tags = { Name = "subnet-privada-ldap" }
}

resource "aws_internet_gateway" "gw_ldap" {
  vpc_id = aws_vpc.ldap.id
  tags = { Name = "igw-ldap" }
}

resource "aws_route_table" "rt_ldap" {
  vpc_id = aws_vpc.ldap.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw_ldap.id
  }
  route {
    cidr_block                = "10.0.0.0/16"
    vpc_peering_connection_id = aws_vpc_peering_connection.peering.id
  }
  tags = { Name = "rt-privada-ldap" }
}

resource "aws_route_table_association" "ldap_assoc" {
  subnet_id      = aws_subnet.ldap_privada.id
  route_table_id = aws_route_table.rt_ldap.id
}