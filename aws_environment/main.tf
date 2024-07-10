provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "ecr" {
  source = "./modules/ecr"
}

module "alb" {
  source          = "./modules/alb"
  vpc_id          = module.vpc.vpc_id
  public_subnets  = module.vpc.public_subnets
  target_subnets  = module.vpc.private_subnets
  certificate_arn = var.certificate_arn
}

module "ecs" {
  source = "./modules/ecs"

  vpc_id            = module.vpc.vpc_id
  private_subnets   = module.vpc.private_subnets
  public_subnets    = module.vpc.public_subnets
  ecr_repository_url = module.ecr.repository_url
  aws_region        = var.aws_region
  target_group_arn  = module.alb.target_group_arn
}
