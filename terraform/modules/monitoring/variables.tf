variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

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

variable "location" {
  description = "Location for the BigQuery dataset"
  type        = string
  default     = "US"
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