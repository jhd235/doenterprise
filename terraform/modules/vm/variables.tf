variable "instance_name" {
  description = "Name of the instance"
  type        = string
}

variable "machine_type" {
  description = "Machine type to create"
  type        = string
  default     = "e2-micro"
}

variable "zone" {
  description = "Zone where the instance should be created"
  type        = string
  default     = "europe-west10-a"
}

variable "boot_disk_image" {
  description = "Source image for the boot disk"
  type        = string
  default     = "projects/debian-cloud/global/images/debian-12-bookworm-v20250311"
}

variable "boot_disk_size" {
  description = "Size of the boot disk in GB"
  type        = number
  default     = 10
}

variable "boot_disk_type" {
  description = "Type of the boot disk"
  type        = string
  default     = "pd-balanced"
}

variable "boot_disk_auto_delete" {
  description = "Whether the boot disk should be auto-deleted"
  type        = bool
  default     = true
}

variable "can_ip_forward" {
  description = "Enable IP forwarding"
  type        = bool
  default     = false
}

variable "deletion_protection" {
  description = "Enable deletion protection"
  type        = bool
  default     = false
}

variable "enable_display" {
  description = "Enable display device"
  type        = bool
  default     = false
}

variable "labels" {
  description = "Labels to apply to the instance"
  type        = map(string)
  default = {
    goog-ec-src = "vm_add-tf"
  }
}

variable "metadata" {
  description = "Metadata to apply to the instance"
  type        = map(string)
  default = {
    enable-osconfig = "TRUE"
  }
}

variable "network_tier" {
  description = "Network tier for the instance"
  type        = string
  default     = "PREMIUM"
}

variable "queue_count" {
  description = "Number of queues per network interface"
  type        = number
  default     = 0
}

variable "stack_type" {
  description = "IP stack type"
  type        = string
  default     = "IPV4_ONLY"
}

variable "subnetwork" {
  description = "Subnetwork to attach the instance to"
  type        = string
  default     = "projects/soy-transducer-455914-i5/regions/europe-west10/subnetworks/default"
}

variable "automatic_restart" {
  description = "Enable automatic restart"
  type        = bool
  default     = true
}

variable "on_host_maintenance" {
  description = "Host maintenance behavior"
  type        = string
  default     = "MIGRATE"
}

variable "preemptible" {
  description = "Enable preemptible instance"
  type        = bool
  default     = false
}

variable "provisioning_model" {
  description = "Provisioning model"
  type        = string
  default     = "STANDARD"
}

variable "service_account_email" {
  description = "Service account email"
  type        = string
  default     = "109297754786-compute@developer.gserviceaccount.com"
}

variable "service_account_scopes" {
  description = "Service account scopes"
  type        = list(string)
  default = [
    "https://www.googleapis.com/auth/devstorage.read_only",
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring.write",
    "https://www.googleapis.com/auth/service.management.readonly",
    "https://www.googleapis.com/auth/servicecontrol",
    "https://www.googleapis.com/auth/trace.append"
  ]
}

variable "enable_integrity_monitoring" {
  description = "Enable integrity monitoring"
  type        = bool
  default     = true
}

variable "enable_secure_boot" {
  description = "Enable secure boot"
  type        = bool
  default     = false
}

variable "enable_vtpm" {
  description = "Enable vTPM"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Network tags"
  type        = list(string)
  default     = ["http-server"]
}

variable "project_id" {
  description = "Project ID"
  type        = string
} 