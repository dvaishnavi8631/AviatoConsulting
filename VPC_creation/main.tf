       module "networking" {
        source                = "./Task2_Reusables"
        vpc_name              = "example-vpc"
        subnet_cidrs          = { subnet-a = "10.0.1.0/24", subnet-b = "10.0.2.0/24" }
        subnet_prefix         = "example-prefix"  
        cloud_run_service_name = "example-cloud-run"
        cloud_run_image        = "us-central1-docker.pkg.dev/<project-id>/hello-world-repo/hello-world:latest"
        region                 = "us-central1"
        }