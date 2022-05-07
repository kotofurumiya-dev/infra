locals {
  project_id     = "kotofurumiya-dotdev-dev"
  project_number = "748644719084"
  region         = "asia-northeast1"
}

terraform {
  required_version = "~> 1.1.0"

  cloud {
    organization = "kotofurumiya"

    workspaces {
      name = "kotofurumiya-dotdev-dev"
    }
  }
}

provider "google" {
  project = local.project_id
  region  = local.region
}

module "network" {
  source     = "../../modules/network"
  project_id = local.project_id
  region     = local.region
  app_domain = "app-dev.kotofurumiya.dev"
}