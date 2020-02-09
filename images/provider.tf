
variable "path" { default = "/home/carlos/git" }
variable "project" { default = "groovy-gearbox-267519"}


provider "google" {
    project = "${var.project}"
    region = "${var.zone}"
    credentials = "${file("${var.path}/terraform2.json")}"
}
