module "vpc" {
  source = "../../modules/vpc"

  project      = var.project
  environment  = var.environment
  cluster_name = var.cluster_name
}

module "iam" {
  source = "../../modules/iam"

  project     = var.project
  environment = var.environment
}


module "eks" {
  source = "../../modules/eks"

  cluster_name    = var.cluster_name
  cluster_version = "1.32"

  cluster_role_arn   = module.iam.cluster_role_arn
  private_subnet_ids = module.vpc.private_subnet_ids
  node_role_arn      = module.iam.node_role_arn
}


module "karpenter" {
  source = "../../modules/karpenter"

  cluster_name     = module.eks.cluster_name
  cluster_endpoint = module.eks.cluster_endpoint

  oidc_provider_arn = module.eks.oidc_provider_arn

  project     = var.project
  environment = var.environment
}