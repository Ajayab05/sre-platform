terraform {
  backend "s3" {
    bucket         = "sre-platform-dev-tf-state-775935274406"
    key            = "environments/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "sre-platform-dev-terraform-lock"
    encrypt        = true
  }
}