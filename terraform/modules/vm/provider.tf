terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.28.0"
    }
  }
}

provider "google" {
  project     = "soy-transducer-455914-i5"
  region      = "europe-west10"
  credentials = file("../../soy-transducer-455914-i5-eb4acc5d0af2.json")
} 