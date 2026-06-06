provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Project     = "sre-platform"
      Environment = "dev"
      ManagedBy   = "Terraform"
    }
  }
}