# resource "aws_s3_bucket" "s3" {
#   bucket = "ajay-terraform-bucket"

#   tags = {
#     Name        = "ajay-terraform-bucket"
#     Environment = "Dev"
#   }
# }

# resource "aws_dynamodb_table" "ajay-terraform-state-lock" {
#   name         = "ajay-terraform-state-lock"
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key     = "LockID"

#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }

#S3 Bucket & Dynamodb should be created previously
terraform {

  backend "s3" {
    bucket         = "ajay-terraform-bucket"
    key            = "ajay-terraform-bucket.tfstate"
    region         = "us-east-1"
    dynamodb_table = "ajay-terraform-state-lock"
    encrypt        = true
  }
}