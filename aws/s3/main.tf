provider "aws" {
    region = "us-east-1"
}

resource "aws_s3_bucket" "s3_bucket" {
    bucket = "example-bucket-name"
}

resource "aws_s3_bucekt_object" "upload_object" {
    bucket = "example-bucket-name"
    acl = "public-read"
    key = "file-object-name"
    src = "file-object-local-location"
}
