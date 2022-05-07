# VPCを作成する。
resource "google_compute_network" "network" {
  name                    = "network"
  auto_create_subnetworks = false
}

# サブネットワークを適当に切る。
resource "google_compute_subnetwork" "vpc" {
  name          = "vpc-subnetwork"
  ip_cidr_range = "10.2.0.0/16"
  network       = google_compute_network.network.id
  region        = var.region
}

# IAPのSSH転送用のFWルール。
resource "google_compute_firewall" "allow_iap" {
  name      = "allow-iap"
  network   = google_compute_network.network.name
  direction = "INGRESS"

  # https://cloud.google.com/iap/docs/using-tcp-forwarding#create-firewall-rule
  source_ranges = ["35.235.240.0/20"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

# GFEからのアクセスを許可するFWルール。
resource "google_compute_firewall" "allow_google_frontend" {
  name      = "allow-load-balancer"
  network   = google_compute_network.network.name
  direction = "INGRESS"

  # https://cloud.google.com/load-balancing/docs/health-checks#fw-rule
  source_ranges = ["35.191.0.0/16", "130.211.0.0/22", "209.85.152.0/22", "209.85.204.0/22"]

  allow {
    protocol = "tcp"
  }
}
