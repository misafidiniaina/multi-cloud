# the necessary api for gcp
module "gcp_api" {
  source = "../modules/gcp/api"
  gcp_project_id = var.gcp_project_id
}

# The GCP network configuration
module "gcp_network" {
  source = "../modules/gcp/network"
  gcp_region = var.gcp_region
}

# The GKE cluster module
module "gke_cluster" {
  source = "../modules/gcp/gke"
  gke_cluster_location = var.gcp_region
  gke_cluster_network_name = module.gcp_network.network_name
  gke_cluster_subenetwork_name = module.gcp_network.subenetwork_name
  depends_on = [ module.gcp_network ]
}

