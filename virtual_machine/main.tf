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

resource "google_compute_disk" "desk" {
  name = "test-desk"
  type = "pd-ssd"
  zone = "${var.zone}"
  size = "10"
}

resource "google_compute_attached_disk" "default" {
  disk = "${google_compute_disk.desk.self_link}"
  instance = "${google_compute_instance.default.self_link}"
}




output "machine_type" {
  value = "${google_compute_instance.default.machine_type}"
}

output "name" {
  value = "${google_compute_instance.default.name}"
}

output "zone" {
  value = "${google_compute_instance.default.zone}"
}