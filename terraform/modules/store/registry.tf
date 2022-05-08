# Artifact Registryを有効化。
resource "google_project_service" "artifactregistry" {
  service = "artifactregistry.googleapis.com"
}

# ウェブサーバのimage用のDockerリポジトリ。
resource "google_artifact_registry_repository" "server" {
  provider = google-beta

  location      = var.region
  repository_id = "server"
  format        = "DOCKER"

  depends_on = [
    google_project_service.artifactregistry
  ]

  lifecycle {
    prevent_destroy = true
  }
}