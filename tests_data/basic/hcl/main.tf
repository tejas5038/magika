terraform {
  required_version = ">= 1.6.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}

variable "project_id" {
  type        = string
  description = "Google Cloud project that owns the service."
}

resource "google_service_account" "worker" {
  project      = var.project_id
  account_id   = "batch-worker"
  display_name = "Batch processing worker"
}

output "worker_email" {
  value = google_service_account.worker.email
}
