terraform {
  backend "s3" {
    bucket = "bucketsalokhiddin"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}