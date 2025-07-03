resource "google_compute_network" "google_vpc" {
  name = "google_vpc"
}

resource "google_compute_subnetwork" "google_vpc_subnetwork" {
  name = "google_vpc_subnetwork"
  region = var.gcp_region
  network = google_compute_network.google_vpc.id
}

