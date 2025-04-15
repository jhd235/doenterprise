variable "bucket_name" {
  description = "The name of the bucket (must be globally unique)"
  type        = string
}

variable "location" {
  description = "The location of the bucket"
  type        = string
  default     = "US"
}

variable "storage_class" {
  description = "The storage class of the bucket"
  type        = string
  default     = "STANDARD"
}

variable "versioning_enabled" {
  description = "Enable versioning for the bucket"
  type        = bool
  default     = false
}

variable "lifecycle_age" {
  description = "Number of days to retain files before deletion"
  type        = number
  default     = 30
}

variable "force_destroy" {
  description = "Force destroy bucket even if it contains objects"
  type        = bool
  default     = false
}

variable "google_credentials" {
  description = "Google Cloud credentials JSON"
  type        = string
  sensitive   = true
}

variable "github_token" {
  description = "GitHub personal access token"
  type        = string
  sensitive   = true
}

# Cloud Build Variables
variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "project_number" {
  description = "The GCP project number"
  type        = string
}

variable "github_owner" {
  description = "GitHub repository owner"
  type        = string
}

variable "github_repo" {
  description = "GitHub repository name"
  type        = string
}

variable "trigger_name" {
  description = "Name of the Cloud Build trigger"
  type        = string
}

# Monitoring Variables
variable "workspace_name" {
  description = "Name of the monitoring workspace"
  type        = string
  default     = "main-workspace"
}

variable "log_sink_name" {
  description = "Name of the log sink"
  type        = string
  default     = "bigquery-sink"
}

variable "log_filter" {
  description = "Filter for the log sink"
  type        = string
  default     = "severity>=DEFAULT"
}

variable "bigquery_dataset_id" {
  description = "ID of the BigQuery dataset for logs"
  type        = string
  default     = "logs_dataset"
}

variable "table_expiration_ms" {
  description = "Default table expiration time in milliseconds"
  type        = number
  default     = 2592000000 # 30 days
}

variable "alert_email" {
  description = "Email address for alert notifications"
  type        = string
} 