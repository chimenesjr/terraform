
variable "path" { default = "/home/carlos/git" }

provider "google" {
    project = "groovy-gearbox-267519"
    region = "${var.zone}"
    credentials = "${file("${var.path}/terraform2.json")}"
}
