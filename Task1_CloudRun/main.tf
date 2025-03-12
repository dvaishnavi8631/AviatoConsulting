provider "Google" {
    project = var.project_id
    region = var.region
}
resource "google_cloud_run_service" "hello_world" {
    name = "hello_world_service"
    location = var.region

    template {
      spec {
        containers {
          image = "${var.artifact_registry}/${var.project_id}/hello_world:latest"
          ports {
            container_port = 8080                    #change_as per entioned by client 
          }
        }
      }
    }
  traffic {
    percent = 100 #client requirement
    latest_revision = true
  }
}

resource "google_project_service" "cloud_run" {
    service = "run.googleapis.com"                       #mentioned
  
}

resource "google_project_service" "cloud_build" {
  
  service = "cloudbuild.googleapis.com"                 #mentioned
}

resource "google_project_service" "artifact_registry" {
    service = "artifactregistry.googleapis.com"         #mentioned
  
}