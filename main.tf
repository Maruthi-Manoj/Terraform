resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  tags = [
    "${var.network}-firewall-http",
    "${var.network}-firewall-https",
  ]

  boot_disk {
    initialize_params {
      image = "centos-6-v20180611"
    }
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.test_network_subnetwork.name}" 
    
    access_config {
      // Ephemeral IP
    }
  }

  metadata {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

}
