terraform {
  backend "s3" {
    bucket = "terraformbucketji"
    key    = "07-statefile"
    region = "us-east-1"
  }
}
