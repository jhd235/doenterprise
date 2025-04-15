variable "bucket_name" {
  description = "The name of the GCS bucket to store Terraform state"
  type        = string
}

variable "location" {
  description = "The location of the GCS bucket"
  type        = string
  default     = "US"
}

variable "force_destroy" {
  description = "When deleting a bucket, this boolean option will delete all contained objects"
  type        = bool
  default     = false
}

variable "service_account_email" {
  description = "The email of the service account that will access the state bucket"
  type        = string
}

variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region"
  type        = string
  default     = "europe-west10"
}

variable "credentials" {
  description = "Path to the GCP credentials file"
  type        = string
} 