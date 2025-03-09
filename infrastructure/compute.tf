
resource "aws_instance" "app_server" {
  ami           = "ami-072298436ce5cb0c4" #Amazon Linux 2 2023 AMI
  instance_type = "t3.micro"              #無料枠で使用できるのは t2.microとt3.micro
  subnet_id     = aws_subnet.private-1a.id
  tags = {
    Name = var.instance_name
  }
}
