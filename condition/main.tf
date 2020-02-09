resource "google_compute_instance" "default" {
  name         = "test-1"
  machine_type = "${var.environment == "production" ? var.machine_type : var.machine_type_dev}"
  zone         = "${var.zone}"

  boot_disk {
    initialize_params {
      image = "${var.image}"
    }
  }

  network_interface {
    network = "default"
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }

}
