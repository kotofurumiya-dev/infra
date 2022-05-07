locals {
  project_id     = "kotofurumiya-dotdev"
  project_number = "583712481801"
  region         = "asia-northeast1"
}

terraform {
  required_version = "~> 1.1.0"

  cloud {
    organization = "kotofurumiya"

    workspaces {
      name = "kotofurumiya-dotdev-prod"
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
  app_domain = "app.kotofurumiya.dev"
}
