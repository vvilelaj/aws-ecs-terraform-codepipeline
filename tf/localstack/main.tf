provider "aws" {
  region = "us-west-1"

  access_key = "test"
  secret_key = "test"

  skip_credentials_validation = true
  skip_metadata_api_check     = true
  # s3_force_path_style         = true
  skip_requesting_account_id  = true

  endpoints {
      sqs = "http://localstack:4566"
  }
}

 resource "aws_sqs_queue" "vvj-simpledomain-inbox-queue" {
  name                      = "vvj-simpledomain-inbox-queue"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
#   redrive_policy = jsonencode({
#     deadLetterTargetArn = aws_sqs_queue.terraform_queue_deadletter.arn
#     maxReceiveCount     = 4
#   })

  tags = {
    Environment = "production"
  }
}