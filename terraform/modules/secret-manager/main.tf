resource "google_secret_manager_secret" "service_account_key" {
  secret_id = "terraform-service-account-key"

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "service_account_key" {
  secret      = google_secret_manager_secret.service_account_key.id
  secret_data = var.service_account_key_json
} 