terraform {
  backend "s3" {
    bucket = "bucketsalokhiddin"
    key    = "terraform.tfstate"
    region = var.aws_region
  }
}