output "network_name" {
  value = google_compute_network.google_vpc.name
}

output "subenetwork_name" {
  value = google_compute_subnetwork.google_vpc_subnetwork.name
}