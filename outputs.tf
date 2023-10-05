output "product_database_address" {
  value = aws_db_instance.database.address
}

output "boundary_target_id_admin" {
  value = boundary_target.database_admin.id
}

output "boundary_target_id_app" {
  value = boundary_target.database_app.id
}

output "ecr_repository" {
  value = aws_ecr_repository.module.repository_url
}