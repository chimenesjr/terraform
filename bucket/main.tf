resource "google_storage_bucket" "bucket" {
  
    count = 1
    name = "chimenesjr-test-2"
    storage_class = "REGIONAL"
    location = "${var.zone}"

    labels {
        test = "to-learn"
        type = "temp"
    }

    versioning {
        enabled = true
    }
}
