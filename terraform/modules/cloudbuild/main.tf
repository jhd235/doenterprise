resource "google_cloudbuild_trigger" "terraform_pipeline" {
  name        = var.trigger_name
  description = var.trigger_description
  project     = var.project_id

  github {
    owner = var.github_owner
    name  = var.github_repo
    push {
      branch = var.branch_pattern
    }
  }

  included_files = [
    "terraform/vm-config/*.tf",
    "terraform/vm-config/*.tfvars"
  ]

  build {
    step {
      name = "gcr.io/cloud-builders/gcloud"
      args = ["components", "install", "beta"]
    }

    step {
      name = "hashicorp/terraform:1.7.0"
      args = ["version"]
    }

    step {
      name = "hashicorp/terraform:1.7.0"
      args = ["fmt", "-check", "-recursive"]
      dir  = "terraform/vm-config"
    }

    step {
      name = "hashicorp/terraform:1.7.0"
      args = ["validate"]
      dir  = "terraform/vm-config"
    }

    step {
      name = "hashicorp/terraform:1.7.0"
      args = ["init", "-backend-config=bucket=${var.project_id}-terraform-state"]
      dir  = "terraform/vm-config"
    }

    step {
      name = "hashicorp/terraform:1.7.0"
      args = ["plan", "-out=tfplan"]
      dir  = "terraform/vm-config"
    }

    step {
      name = "hashicorp/terraform:1.7.0"
      args = ["apply", "-auto-approve", "tfplan"]
      dir  = "terraform/vm-config"
    }

    artifacts {
      objects {
        location = "gs://${var.project_id}-terraform-plans/"
        paths    = ["tfplan"]
      }
    }

    options {
      logging = "CLOUD_LOGGING_ONLY"
    }

    timeout = "1200s"
  }
}

# IAM permissions for Cloud Build
resource "google_project_iam_member" "cloudbuild_service_account" {
  project = var.project_id
  role    = "roles/cloudbuild.builds.builder"
  member  = "serviceAccount:${var.project_number}@cloudbuild.gserviceaccount.com"
}

resource "google_project_iam_member" "cloudbuild_storage" {
  project = var.project_id
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${var.project_number}@cloudbuild.gserviceaccount.com"
}

# More specific roles instead of roles/editor
resource "google_project_iam_member" "cloudbuild_compute" {
  project = var.project_id
  role    = "roles/compute.instanceAdmin.v1"
  member  = "serviceAccount:${var.project_number}@cloudbuild.gserviceaccount.com"
}

resource "google_project_iam_member" "cloudbuild_service_account_user" {
  project = var.project_id
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:${var.project_number}@cloudbuild.gserviceaccount.com"
}

resource "google_project_iam_member" "cloudbuild_resource_manager" {
  project = var.project_id
  role    = "roles/resourcemanager.projectIamAdmin"
  member  = "serviceAccount:${var.project_number}@cloudbuild.gserviceaccount.com"
}