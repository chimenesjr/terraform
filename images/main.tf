
resource "google_compute_image" "image" {
  
    name = "terraform-image"
    family = "my-family"

    source_disk =  "projects/${var.project}/zones/${var.zone}/disks/test-1"
   
}
