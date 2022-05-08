# Cloud Runデプロイ用のサービスアカウント。
resource "google_service_account" "cloudrun_deploy" {
  account_id = "cloudrun-deploy"
}

# Cloud Runデプロイのために必要なロール。
resource "google_project_iam_member" "cloudrun_deploy_sa_user" {
  project = var.project_id
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:${google_service_account.cloudrun_deploy.email}"
}

resource "google_project_iam_member" "cloudrun_deploy_admin" {
  project = var.project_id
  role    = "roles/run.admin"
  member  = "serviceAccount:${google_service_account.cloudrun_deploy.email}"
}
