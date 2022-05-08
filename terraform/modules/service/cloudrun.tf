# Cloud Run Admin APIを有効化する。
resource "google_project_service" "cloudrun" {
  service = "run.googleapis.com"
}
