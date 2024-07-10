output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "ecr_repository_url" {
  value = module.ecr.repository_url
}

output "ecs_cluster_id" {
  value = module.ecs.cluster_id
}
