terraform {
  required_version = "1.5.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.7.0"
    }
  }
}

provider "aws" {
  alias = "my-provider"
}
