module "vpc" {
  source = "../../modules/vpc"

  project      = var.project
  environment  = var.environment
  cluster_name = var.cluster_name
}