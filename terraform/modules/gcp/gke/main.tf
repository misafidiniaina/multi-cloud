resource "google_container_cluster" "gke_cluster" {
  name = "gke_cluster"
  location = var.gke_cluster_location
  enable_autopilot = true
  network = var.gke_cluster_network_name
  subnetwork = var.gke_cluster_subenetwork_name

  ip_allocation_policy {
    
  }
}