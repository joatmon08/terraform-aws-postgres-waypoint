output "product_database_address" {
  value = aws_db_instance.database.address
}

output "boundary_target_postgres" {
  value = boundary_target.database.id
}

output "ecr_repository" {
  value = aws_ecr_repository.module.repository_url
}