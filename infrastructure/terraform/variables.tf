variable "aws_profile" {
  description = "aws profile"
  type        = string
  default     = "private"
}
# VPC
variable "vpc_cidr" {
  description = "The CIDR block of the VPC"
  type        = string
  default     = "10.0.0.0/24"
}
variable "vpc_name" {
  type    = string
  default = "practice-vpc"
}
# instance
variable "instance_name" {
  type    = string
  default = "practice-server"
}
# subnet
variable "vpc_subnet" {
  type    = string
  default = "10.0.0.0/24"
}
variable "vpc_subnet_name" {
  type    = string
  default = "practice-subnet"
}
# インターネットゲートウェイ
variable "aws_internet_gateway_name" {
  type    = string
  default = "practice-igw"
}
# パブリックルートテーブル
variable "root_table_public_table" {
  type    = string
  default = "practice-root-table-public"
}
# s3
variable "aws_s3_bucket_name" {
  type    = string
  default = "practice-s3-bucket-name-fj"
}
