module "dynamodb" {
  source        = "./dynamodb"
  partition_key = "RideId"
}

module "lambda" {
  source       = "./lambda"
  dynamodb_arn = module.dynamodb.dynamodb_arn
}