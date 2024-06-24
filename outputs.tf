output "database_address" {
  value       = aws_db_instance.database.address
  description = "Address of database"
}

output "database_name" {
  value       = aws_db_instance.database.db_name
  description = "Database name"
}

output "boundary_target_id_admin" {
  value       = boundary_target.database_admin.id
  description = "Boundary target ID for database"
}

output "boundary_target_id_app" {
  value       = boundary_target.database_app.id
  description = "Boundary target ID for application"
}