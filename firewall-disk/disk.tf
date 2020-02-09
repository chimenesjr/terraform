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