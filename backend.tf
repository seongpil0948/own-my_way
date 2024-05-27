terraform {
  cloud {
    organization = "own-my_way"
    hostname     = "app.terraform.io"

    workspaces {
      name = "aws-tfc"
    }
  }
  required_version = "~> 1.8.0" # 테라폼 버전

  required_providers { # 프로바이더 버전을 나열
    # random = {
    #   version = ">= 3.0.0, < 3.1.0"
    # }
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.2.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~>2.30.0"
    }
  }
  # 테라폼 실행에의한 state를 보관하는 위치를 지정
  # 작업자간 협업을 고려, 원격 저장소가 필요
  # 패스워드, 인증서가 포함된 파일이므로 보안에 주의
  # 하나의 백엔드만 허용
  # backend "local" { # "local" 의 경우 로컬에 저장
  #   path = "relative/path/to/terraform.tfstate"
  # }
}


provider "aws" {
  region     = var.region
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
  default_tags {
    tags = {
      Project = "aws-tfc",
      Owner   = "seongpilChoi"
    }
  }
}
