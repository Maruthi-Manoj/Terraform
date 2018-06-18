// Configure the Google Cloud provider
provider "google" {
  credentials = "${file("${path.module}/admin.json")}"
  project     = "${var.project-name}"
  region      = "${var.region}"
}

