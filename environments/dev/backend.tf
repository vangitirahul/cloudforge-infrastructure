terraform {
  backend "s3" {
    bucket         = "cloudforge-tf-state-rv-2026"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "cloudforge-tf-locks"
    encrypt        = true
  }
}
