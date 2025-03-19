resource "aws_quicksight_data_source" "energy_source" {
  data_source_id = "energy-source"
  name           = "Energy Data Source"
  type           = "ATHENA"
}