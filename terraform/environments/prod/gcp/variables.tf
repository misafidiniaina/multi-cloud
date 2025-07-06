variable "gcp_project_id" {
  description = "The ID of the Google Cloud project"
  type        = string 
}

variable "gcp_region" {
  description = "The region of your GCP project"
  type        = string
  
}

variable "gcp_zone" {
  description = "The zone of your GCP project"
  type        = string 
}

variable "gke_cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
}

variable "gcp_vpc_name" {
  description = "The name of the GCP VPC"
  type        = string
}