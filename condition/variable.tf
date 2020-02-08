variable "image" {
  default = "ubuntu-os-cloud/ubuntu-1604-lts"
}

variable "zone" {
    default = "us-east1-b"  
}

variable "environment" { default = "production" }
variable "machine_type_dev" { default = "f1-micro" }
variable "machine_type" { default =  "n1-standard-1" }
