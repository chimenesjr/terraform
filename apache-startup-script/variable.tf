variable "image" {
  default = "debian-cloud/debian-9"
}

variable "zone" {
    default = "us-east1-b"  
}

variable "environment" { default = "dev" }
variable "machine_type_dev" { default = "f1-micro" }
variable "machine_type" { default =  "n1-standard-1" }
