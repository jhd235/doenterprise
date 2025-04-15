# Root level variables can be added here if needed 

# Cloud Build Configuration
project_id     = "soy-transducer-455914-i5"
project_number = "109297754786"
github_owner   = "jhd235"
github_repo    = "gcp"
trigger_name   = "triggerGH"

# GCS Configuration (if needed)
bucket_name        = "gcp-doe-iac-state" # Using existing bucket name
location           = "EU"                # Matching existing bucket location
storage_class      = "STANDARD"
versioning_enabled = true # Matching existing bucket versioning
lifecycle_age      = 30
force_destroy      = false 