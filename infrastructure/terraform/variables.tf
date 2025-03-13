variable "aws_profile" {
  description = "aws profile"
  type        = string
  default     = "private"
}
# VPC
variable "vpc_cidr" {
  description = "The CIDR block of the VPC"
  type        = string
  default     = "10.0.0.0/16"
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
variable "vpc_subnet1" {
  type    = string
  default = "10.0.1.0/24"
}
variable "vpc_subnet2" {
  type    = string
  default = "10.0.2.0/24"
}
variable "vpc_public_subnet_name" {
  type    = string
  default = "practice-private-subnet"
}
variable "vpc_private_subnet_name" {
  type    = string
  default = "practice-private-subnet"
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
# プライベートルートテーブル
variable "root_table_private_table" {
  type    = string
  default = "practice-root-table-private"
}
# s3
variable "aws_s3_bucket_name" {
  type    = string
  default = "practice-s3-bucket-name-fj"
}
# lambda
variable "aws_lambda_function_name" {
  type    = string
  default = "practice-lambda"

}

# null_resouse
variable "image_name" {
  type    = string
  default = "practice-image-tag"
}

variable "tag_name" {
  type    = string
  default = "practice-ecr-tag"
}

data "aws_caller_identity" "self" {}

locals {
  account_id = data.aws_caller_identity.self.account_id
}