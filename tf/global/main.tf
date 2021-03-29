terraform {
  backend "s3" {
    bucket = "vvj-tf-state"
    key    = "global/simple-domain/terraform.tfstate"
    region = "us-west-1"
  }
}

provider "aws" {
  region = "us-west-1"
}

locals {
  environment    = "global"
  domain         = "simple-domain"
  classification = "api"
}

resource "aws_ecr_repository" "ecr-repository" {
  name                 = "${local.domain}/${local.classification}"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    "environment"    = local.environment
    "domain"         = local.domain
    "classification" = local.classification
  }
}