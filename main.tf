terraform {
   backend "s3" {
     bucket         = "naruto-985729960198-bucket"
     key            = "dev/terraform.tfstate"
     region         = "ca-central-1"
     dynamodb_table = "narutoDB"
 }
}
resource "aws_s3_bucket" "narutos3" {
  bucket = "naruto-985729960198-bucket"
  tags = {
    Name        = "naruto-985729960198-bucket"
    Environment = "dev"
  }
}
resource "aws_s3_bucket_versioning" "versioning_narutos3" {
  bucket = aws_s3_bucket.narutos3.id
  
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "narutoDB" {
  name           = "narutoDB"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    "Name" = "naruto_DB"
 }
}



