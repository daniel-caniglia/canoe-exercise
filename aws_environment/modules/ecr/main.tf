resource "aws_ecr_repository" "hello_world" {
  name = "hello-world-repo"
}

output "repository_url" {
  value = aws_ecr_repository.hello_world.repository_url
}
