Task1: Cloud Run Deployment using Terraform
Prerequisites:
    1. GCP account
    2. CLI installed and authenticated
    3. Terraform installed

Steps:
    1. Clone the repository with "git clone <repo_url>
    2. cd Tak1_CloudRun

    3. Set up the environment varibles with : export PROJECT_ID = <gcp_project_id>
    4. set the project with: gcloud config set project $gcp_project_id

    5. enable required APIs (either through CLI or console. Best practice is using CLI)
        - gcloud services enable run.googleapis.com
        - gcloud services enable cloudbuild.googleapis.com
        - gcloud services enable artifactregistry.googleapis.com
    
    6. Now build and push the docker image into artifact registry:

        - gcloud artifacts repositories create hello-world-repo \
          --repository-format=docker \
          --location= default \                                        (created artifact registry)

        - docker build -t us-central1-docker.pkg.dev/$PROJECT_ID/hello-world-repo/hello-world:latest . (building image)
        - docker push us-central1-docker.pkg.dev/$PROJECT_ID/hello-world-repo/hello-world:latest       (Pushing image)

    7. Deploy using terraform:
        - terraform init
        - terraform plan
        - terraform apply 

    8. Once the service is deployed, in the output file, terraform will output the url for the cloud run service which can be          access via URL