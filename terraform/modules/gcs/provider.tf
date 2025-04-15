terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.28.0"
    }
  }
}

provider "google" {
  project = "soy-transducer-455914-i5"
  region  = "europe-west10"
  # Credentials will be read from GOOGLE_APPLICATION_CREDENTIALS environment variable
} 