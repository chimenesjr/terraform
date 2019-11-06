# https://github.com/HoussemDellai/Terraform-GCP/blob/master/vm-network/main.tf

provider "google" {
    credentials = "${file("../book-255910-cb84b5f5eb61.json")}"
    project = "book-255910"
    region = "us-central1"
    zone = "us-central1-c"
}

resource "google_compute_instance" "default" {
  name         = "terraform-instance"
  machine_type = "f1-micro"

  tags = ["http-server"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "${google_compute_network.vpc_network.self_link}"
  }
}

resource "google_compute_network" "vpc_network" {
  name                    = "terraform-network"
  auto_create_subnetworks = "true"
}