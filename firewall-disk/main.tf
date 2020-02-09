resource "google_compute_instance" "default" {
  name         = "test-1"
  machine_type = "${var.environment == "production" ? var.machine_type : var.machine_type_dev}"
  zone         = "${var.zone}"
  can_ip_forward = "false"
  description = "This is our Virtual Machine"
  
  tags = [ "allow-http", "allow-htts" ] # firewall

  boot_disk {
    initialize_params {
      image = "${var.image}"
      size = "20"
    }
  }

  labels = {
    name = "test-1"
    machine_type = "${var.environment == "production" ? var.machine_type : var.machine_type_dev}"
  }

  metadata = {
    size = "20"
    foo = "bar"
  }

  metadata_startup_script = "echo hi > test.txt"

  network_interface {
    network = "default"
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }

}
