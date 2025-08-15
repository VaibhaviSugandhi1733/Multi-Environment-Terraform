resource "aws_s3_bucket" "my-bucket" {
   bucket = "${var.my-env}-my-s3-vaibhavi"

  tags = {
    Name = "${var.my-env}-my-s3-vaibhavi"
    environment = var.my-env 
  }
}