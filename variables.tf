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

variable "region" {
  description = "The region where the resources are created."
  default     = "ap-northeast-2"
  validation {
    condition     = can(regex("ap-northeast-2|us-west-2|eu-west-1", var.region))
    error_message = "The region must be either ap-northeast-2, us-west-2, or eu-west-1."

  }
}

variable "address_space" {
  description = "The address space that is used by the virtual network. You can supply more than one address space. Changing this forces a new resource to be created."
  default     = "10.0.0.0/16"
}

variable "subnet_prefix" {
  description = "The address prefix to use for the subnet."
  default     = "10.0.10.0/24"
}

variable "instance_type" {
  description = "Specifies the AWS instance type."
  default     = "t3.micro"
}

variable "height" {
  default     = "400"
  description = "Image height in pixels."
}

variable "width" {
  default     = "600"
  description = "Image width in pixels."
}

variable "placeholder" {
  default     = "placekitten.com"
  description = "Image-as-a-service URL. Some other fun ones to try are fillmurray.com, placecage.com, placebeard.it, loremflickr.com, baconmockup.com, placeimg.com, placebear.com, placeskull.com, stevensegallery.com, placedog.net"
}

variable "AWS_ACCESS_KEY_ID" {
  description = "The AWS access key"
  sensitive   = true
}
variable "AWS_SECRET_ACCESS_KEY" {
  description = "value of the AWS secret key"
  sensitive   = true
}
