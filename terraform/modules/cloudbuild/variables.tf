variable "trigger_name" {
  description = "Name of the Cloud Build trigger"
  type        = string
}

variable "trigger_description" {
  description = "Description of the Cloud Build trigger"
  type        = string
  default     = "Cloud Build trigger for Terraform operations"
}

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

variable "branch_pattern" {
  description = "GitHub branch pattern to trigger builds"
  type        = string
  default     = "^main$"
} 