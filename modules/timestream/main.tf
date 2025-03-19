resource "aws_timestreamwrite_database" "energy_db" {
  database_name = "energy-db"
}

resource "aws_timestreamwrite_table" "energy_table" {
  database_name = aws_timestreamwrite_database.energy_db.database_name
  table_name    = "energy-table"
}

output "timestream_db_name" {
  value = aws_timestreamwrite_database.energy_db.database_name
}