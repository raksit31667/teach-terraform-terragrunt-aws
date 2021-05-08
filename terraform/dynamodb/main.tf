resource "aws_dynamodb_table" "rides-table" {
  hash_key       = var.partition_key
  name           = "Rides"
  write_capacity = 20
  read_capacity  = 20
  attribute {
    name = var.partition_key
    type = "S"
  }

  tags = {
    Environment = "production"
  }
}