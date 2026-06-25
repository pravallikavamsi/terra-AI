output "vpc_id" {
  description = "ID of the VPC"
  value       = google_compute_network.main.id
}

output "vpc_name" {
  description = "Name of the VPC"
  value       = google_compute_network.main.name
}

output "subnet_id" {
  description = "ID of the subnet"
  value       = google_compute_subnetwork.app_subnet.id
}

output "subnet_name" {
  description = "Name of the subnet"
  value       = google_compute_subnetwork.app_subnet.name
}

output "subnet_cidr" {
  description = "CIDR range of the subnet"
  value       = google_compute_subnetwork.app_subnet.ip_cidr_range
}

output "route_name" {
  description = "Name of the route"
  value       = google_compute_route.app_route.name
}

output "static_ip" {
  description = "Reserved static external IP"
  value       = google_compute_address.static_ip.address
}

output "vm_name" {
  description = "Name of the VM instance"
  value       = google_compute_instance.vm.name
}

output "vm_zone" {
  description = "Zone of the VM instance"
  value       = google_compute_instance.vm.zone
}

output "vm_private_ip" {
  description = "Private IP address of the VM"
  value       = google_compute_instance.vm.network_interface[0].network_ip
}

output "vm_public_ip" {
  description = "Public IP address of the VM"
  value       = google_compute_instance.vm.network_interface[0].access_config[0].nat_ip
}
