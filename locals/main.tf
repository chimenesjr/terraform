locals {
  full-name = "${var.name1}-${var.name2}"
}


resource "google_storage_bucket" "bucket" {
  
    count = 1
    name = "${local.full-name}"
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
