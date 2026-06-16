provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "cloudforge"
      Environment = "dev"
      ManagedBy   = "terraform"
    }
  }
}
