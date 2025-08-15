resource "aws_dynamodb_table" "my_app_table" {
  name = "${var.my-env}-my-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "userID"
  attribute {
    
        name = "userID"
        type = "S"

    }

    tags = {
        name = "${var.my-env}-my-table"
    }
  }
