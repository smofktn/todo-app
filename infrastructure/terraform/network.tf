# vpc
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}
# パブリックサブネット
resource "aws_subnet" "public-1a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.vpc_subnet1
  availability_zone = "ap-northeast-1a" #アジアパシフィック（東京）リージョン
  tags = {
    Name = var.vpc_public_subnet_name
  }
}

# プライベートサブネット
resource "aws_subnet" "private-1a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.vpc_subnet2
  availability_zone = "ap-northeast-1a" #アジアパシフィック（東京）リージョン
  tags = {
    Name = var.vpc_private_subnet_name
  }
}

# インターネットゲットウェイ
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id #紐づけるVPC
  tags = {
    Name = var.aws_internet_gateway_name
  }
}

# パブリックルートテーブル
resource "aws_route_table" "rtb-public" {
  vpc_id = aws_vpc.vpc.id #VPCとの紐付け

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id #IGWとの紐付け
  }

  tags = {
    Name = var.root_table_public_table
  }
}

# バプリックルートテーブルとパブリックサブネットの紐付け
resource "aws_route_table_association" "rtb-public-1a" {
  subnet_id      = aws_subnet.public-1a.id
  route_table_id = aws_route_table.rtb-public.id
}

# プライベートルートテーブル
resource "aws_route_table" "rtb-private" {
  vpc_id = aws_vpc.vpc.id #VPCとの紐付け
  tags = {
    Name = var.root_table_private_table
  }
}
