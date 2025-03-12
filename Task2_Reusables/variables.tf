variable "vpc_name" {
    description = "value"
    type = string
  
}

variable "region" {
    description = "gcp region"
    type = string
}

variable "subnet_cidrs" {
    description = "CIDR blocks"
    type = map(string)

}

variable "cloud_run_service_name" {
    description = "value"
    type = string
  
}

variable "cloud_run_image" {
  description = "Docker image URL for cloud run"
  type = string
}

