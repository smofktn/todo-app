resource "aws_s3_bucket" "practice_s3" {
  bucket = var.aws_s3_bucket_name
  tags = {
    Name = var.aws_s3_bucket_name
  }
}
