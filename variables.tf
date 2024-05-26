# variable "global" {
#   type        = map(string)
#   description = "common variables for all resources"
#   default = {
#     CICD  = "ARGO_CD"
#     CLOUD = "ON_PREM"
#   }
#   validation {
#     condition     = can(regex("ARGO_CD|JENKINS|GITHUB_ACTION", var.global.CICD))
#     error_message = "The CICD must be either ARGO_CD or JENKINS or GITHUB_ACTION."
#   }

#   validation {
#     condition     = length(var.global.CLOUD) > 0
#     error_message = "The global.CLOUD must not be an empty string."
#   }

# }

variable "dev_env" {
  type        = string
  default     = "development"
  description = "The environment for development."
  validation {
    condition     = can(regex("development|staging|production", var.dev_env))
    error_message = "The dev_env must be either development, staging, or production."

  }
}

variable "prefix" {
  description = "This prefix will be included in the name of most resources."
  validation {
    condition     = length(var.prefix) > 2
    error_message = "The prefix must exceed 2 characters."
  }
}

variable "region" {
  description = "The region where the resources are created."
  default     = "ap-northeast-2"
  validation {
    condition     = can(regex("ap-northeast-2|us-west-2|eu-west-1", var.region))
    error_message = "The region must be either ap-northeast-2, us-west-2, or eu-west-1."

  }
}

variable "names" {
  type        = list(string)
  description = "A list of names."
  default     = ["a", "b", "c"]
  validation {
    condition     = length(var.names) > 0
    error_message = "The names list must not be empty."
  }
}

# variable "aws_instance_type" {
#   description = "Specifies the AWS instance type."
#   validation {
#     condition     = can(regex("t[2-3].micro|t[2-3].small|t[2-3].medium", var.aws_instance_type))
#     error_message = "The instance type must be either t2.micro, t2.small, t2.medium, t3.micro, t3.small, or t3.medium."
#   }
# }

# variable "db_password" {
#   description = "The password for the database."
#   type        = string
#   sensitive   = true
# }
