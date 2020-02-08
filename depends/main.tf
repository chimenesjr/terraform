resource "google_compute_instance" "default" {
  name         = "test-1"
  machine_type = "${var.machine_type["dev"]}"
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

  depends_on=["google_compute_instance.second"]

}

resource "google_compute_instance" "second" {
  name         = "test-2"
  machine_type = "${var.machine_type["dev"]}"
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



output "machine_type" {
  value = "${google_compute_instance.default.machine_type}"
}

output "name" {
  value = "${google_compute_instance.default.name}"
}

output "zone" {
  value = "${google_compute_instance.default.zone}"
}