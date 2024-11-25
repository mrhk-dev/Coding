/*
In this file we pass the provider details.
Since we will be using the aws vpc we create the file as below.


*/


terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.68.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

