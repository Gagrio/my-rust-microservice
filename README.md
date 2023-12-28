# my-rust-microservice
a stupid simple rust microservice for testing, creates a simple web server
# steps
1. write microservice in rust that is a web server which prints out a middle finger
2. make it into a container image with Docker, upload image to DockerHub (manually or via script)
3. package the app into a helm chart
4. create a GKE cluster with Terraform
5. deploy the app with terraform helm_release from terraform helm provider via a Github Action that runs terraform
6. deploy the app with another Github Action via helm 
7. deploy the app without being packaged in a helm chart via another Github Action
