output "vpc_name" {
  description = "name of the vpc"
  value = google_compute_network.vpc_network.name 

}

output "subnet_name" {
    description = "created subnets list"
    value       = [for subnet in google_compute_subnetwork.subnet : subnet.name]
  
}

output "cloud_run_url" {
    description = "deployed cloud run url"
    value = google_cloud_run_service.cloud_run.status[0].url
  
}