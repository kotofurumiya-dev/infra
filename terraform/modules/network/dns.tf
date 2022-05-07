# DNSサービスを有効化する。
resource "google_project_service" "dns" {
  service = "dns.googleapis.com"
}

# サブドメインをCloud DNSで管理する。
resource "google_dns_managed_zone" "app_dns_zone" {
  name     = "app-dns-zone"
  dns_name = "${var.app_domain}."

  dnssec_config {
    state = "on"
  }

  depends_on = [
    google_project_service.dns
  ]
}
