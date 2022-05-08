# blog用サーバ実行用のサービスアカウント。
resource "google_service_account" "blog_server" {
  account_id = "blog-service"
}

# Cloud Runでblogサービスアカウントを使用するための権限。
resource "google_project_iam_member" "blog_server_cloudrun_invoker" {
  project = var.project_id
  role    = "roles/run.invoker"
  member  = "serviceAccount:${google_service_account.blog_server.email}"
}
