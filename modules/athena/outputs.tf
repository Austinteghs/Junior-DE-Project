output "athena_db_name" {
  description = "Name of the Athena database"
  value       = aws_athena_database.energy_db.name
}