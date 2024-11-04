# Comment out the below if you are working on local

terraform {
  backend "s3" {
    bucket = "sctp-ce7-tfstate"
    key    = "lcchua-20241105.tfstate" # Change the value of this to yourname-tf-workspace-act.tfstate for  example
    region = "us-east-1"
  }
}