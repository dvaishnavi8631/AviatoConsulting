output "cloud_run_url" {
  description = "URL for the deployed Cloud Run service"
  value       = google_cloud_run_service.hello_world.status[0].url
}
