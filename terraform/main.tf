resource "aws_dynamodb_table" "rides-table" {
  hash_key       = "RideId"
  name           = "Rides"
  write_capacity = 20
  read_capacity  = 20
  attribute {
    name = "RideId"
    type = "S"
  }

  tags = {
    Environment = "production"
  }
}