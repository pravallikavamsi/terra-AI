variable "gcp_project_id" {
  description = "GCP project ID"
  type        = string
}

variable "gcp_region" {
  description = "GCP region"
  type        = string
}

variable "gcp_zone" {
  description = "GCP zone"
  type        = string
}

variable "project_name" {
  description = "Common name prefix for all resources"
  type        = string
}

variable "environment" {
  description = "Environment name like dev or prod"
  type        = string
}

variable "my_ip" {
  description = "Allowed source IP range for SSH access"
  type        = string
}
