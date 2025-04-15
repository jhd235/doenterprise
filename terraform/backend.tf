terraform {
  backend "gcs" {
    bucket = "gcp-doe-iac-state"
    prefix = "terraform/state"
  }
}