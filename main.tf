provider "google" {
  project     = "test-kitchen-271420"
  region      = "us-central1"
  credentials = "../creds/tfv-service-account.json"
}

resource "google_compute_instance" "default" {
  project      = "test-kitchen-271420"
  name         = "test"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
}
