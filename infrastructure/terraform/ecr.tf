resource "aws_ecr_repository" "practice_ecr" {
  name = "practice-ecr"
  tags = {
    name = "practice-ecr"
  }
  ## ecrに格納されているイメージをtrivyでスキャンし、脆弱性を検知する
  image_scanning_configuration { 
    scan_on_push = true
  }

  ## イメージの暗号化
  encryption_configuration {  
    encryption_type = "AES256"
  }
}

