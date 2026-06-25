resource "google_compute_network" "main" {
  name                    = "${var.project_name}-vpc"
  description             = "VPC for Terraform AI demo"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "app_subnet" {
  name          = "${var.project_name}-subnet"
  ip_cidr_range = "10.10.1.0/24"
  region        = var.gcp_region
  network       = google_compute_network.main.id
}

resource "google_compute_route" "app_route" {
  name             = "${var.project_name}-rt"
  network          = google_compute_network.main.name
  dest_range       = "0.0.0.0/0"
  next_hop_gateway = "default-internet-gateway"
  priority         = 1000
}

resource "google_compute_firewall" "allow_ssh" {
  name        = "${var.project_name}-allow-ssh"
  description = "SSH from trusted IP only"
  network     = google_compute_network.main.name
  direction   = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = [var.my_ip]
  target_tags   = ["terra-ai"]

  priority = 1000
}

resource "google_compute_firewall" "allow_http" {
  name        = "${var.project_name}-allow-http"
  description = "HTTP from trusted IP only"
  network     = google_compute_network.main.name
  direction   = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = [var.my_ip]
  target_tags   = ["terra-ai"]

  priority = 1000
}

resource "google_compute_firewall" "allow_https_egress" {
  name        = "${var.project_name}-allow-https-egress"
  description = "Allow HTTPS outbound only"
  network     = google_compute_network.main.name
  direction   = "EGRESS"

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  destination_ranges = ["0.0.0.0/0"]
  target_tags        = ["terra-ai"]

  priority = 1000
}

resource "google_compute_firewall" "deny_all_egress" {
  name        = "${var.project_name}-deny-all-egress"
  description = "Deny all other outbound traffic"
  network     = google_compute_network.main.name
  direction   = "EGRESS"

  deny {
    protocol = "all"
  }

  destination_ranges = ["0.0.0.0/0"]
  target_tags        = ["terra-ai"]

  priority = 2000
}

resource "google_compute_address" "static_ip" {
  name   = "${var.project_name}-static-ip"
  region = var.gcp_region
}

resource "google_compute_instance" "vm" {
  name         = "${var.project_name}-vm"
  machine_type = "e2-standard-4"
  zone         = var.gcp_zone

  tags = ["terra-ai"]

  labels = {
    environment = var.environment
  }

  boot_disk {
    initialize_params {
      image = "rocky-linux-cloud/rocky-linux-9"
      size  = 20
      type  = "pd-balanced"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.app_subnet.id

    access_config {
      nat_ip = google_compute_address.static_ip.address
    }
  }
}
