resource "google_compute_instance" "default" {
  name         = "test-windows-startup-script"
  machine_type = "${var.machine_type}"
  zone         = "${var.zone}"

  boot_disk {
    initialize_params {
      image = "${var.image}"
    }
  }

  tags = [ "http-server" ] # firewall

  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP
    }
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }

  metadata = {
    windows-startup-script-ps1 = "${file("startup.ps1")}"
  }

}
