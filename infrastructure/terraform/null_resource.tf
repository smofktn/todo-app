resource "null_resource" "practice_null_resourse" {

 provisioner "local-exec"{
    command = "aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin ${local.account_id}.dkr.ecr.ap-northeast-1.amazonaws.com"
 } 
  provisioner "local-exec" {
    command = "docker build -t ${var.image_name} --file image_src/Dockerfile ./image_src"
  }

  provisioner "local-exec" {
    command = "docker tag ${var.image_name}:latest ${local.account_id}.dkr.ecr.ap-northeast-1.amazonaws.com/${var.image_name}:latest"
  }

  provisioner "local-exec" {
    command = "docker push ${local.account_id}.dkr.ecr.ap-northeast-1.amazonaws.com/${var.image_name}:latest"
  }
}