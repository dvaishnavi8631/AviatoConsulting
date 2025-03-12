Task 2: Create a New Terraform Module for Reusable Infrastructure Components
Prerequisites:
    1. GCP account
    2. CLI installed and authenticated
    3. Terraform installed

Steps:
    1. Clone the repository with "git clone <repo_url>"
    2. cd Task2_reusables

    3. create the sample main.tf file:
        eg. :

        module "networking" {
        source                = "./Task2_Reusables"
        vpc_name              = "example-vpc"
        subnet_cidrs          = { subnet-a = "10.0.1.0/24", subnet-b = "10.0.2.0/24" }
        subnet_prefix         = "example-prefix"  
        cloud_run_service_name = "example-cloud-run"
        cloud_run_image        = "us-central1-docker.pkg.dev/<project-id>/hello-world-repo/hello-world:latest"
        region                 = "us-central1"
        }

    4. use the terraform:
        - terraform init
        - terraform plan
        - terraform apply
    
    5. terraform will display the outputs in the output file once the resources are deployed succesfully.