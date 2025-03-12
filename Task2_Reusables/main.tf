resource "google_compute_network" "vpc_network" {
    name = var.vpc_name
    auto_create_subnetworks = false 
  
}


resource "google_compute_subnetwork" "subnet" {
    for_each = var.subnet_cidrs

    name = var.subnet_cidrs
    ip_cidr_range = each.value
    region = var.region
    network = google_compute_network.vpc_network.self_link

  
}

resource "google_cloud_run_service" "cloud_run" {
    name = var.cloud_run_service_name
    location = var.region
    
    template {
      spec {
        containers {
          image = var.cloud_run_image
        }
      }
    }
    traffic {
      percent = 100
      latest_revision = true
    }
  
}