variable "image" {
  default = "ubuntu-os-cloud/ubuntu-1604-lts"
}
variable "machine_type" {
    type = "map"
    default = {
        "dev" = "f1-micro"
        "prod" = "wont_work"
    }
}

variable "zone" {
    default = "us-east1-b"  
}
