# Demo Repository: DevOps and SRE Showcase

Welcome to my demo repository! This repository serves as a showcase of my capabilities in the DevOps and Site Reliability Engineering (SRE) skillset. It demonstrates the deployment and orchestration of a Rust microservice in a cloud environment on Google Cloud Platform (GCP), incorporating various DevOps practices.

## Repository Structure

- **src directory**: Contains the source code of a microservice written in Rust.

- **terraform directory**: Includes Terraform (HCL) code responsible for creating a cloud environment on Google Cloud. This environment comprises a Google Cloud project, a GKE (Google Kubernetes Engine) cluster, and a Google Container Registry.

- **helm directory**: Hosts a local Helm chart used to package the Rust microservice from the src directory.

- **helm-values directory**: Stores all the values files for Helm charts deployed via the Terraform Helm provider.

- **.github/workflows directory**: Houses various GitHub Actions workflows for automating tasks such as deploying infrastructure (via Terraform), creating and pushing Docker images to DockerHub, and deploying the application via Helm.

- **DOCKERFILE**: Contains the necessary information to package the application into a Docker container.

## Showcase Overview

This demo illustrates a Rust microservice running on a GKE cluster created through Terraform. The infrastructure includes Service Mesh capabilities via Istio and Observability capabilities through Prometheus and Grafana monitoring tools.

### Key Components

- **Rust Microservice**: The core functionality resides in the `src` directory, showcasing the implementation of a microservice using Rust.

- **Terraform Infrastructure**: The `terraform` directory demonstrates the infrastructure-as-code approach, creating a GCP project, a GKE cluster, and a Google Container Registry to host the microservice's Docker image.

- **Helm Chart**: The `helm` directory contains a local Helm chart, providing a convenient way to package, configure, and deploy the Rust microservice.

- **GitHub Actions**: Automation workflows in the `.github/workflows` directory showcase continuous integration and deployment practices. Actions include deploying infrastructure, building and pushing Docker images, and deploying the application via Helm.

### DevOps Capabilities

- **Service Mesh (Istio)**: The GKE cluster is configured with Istio for Service Mesh capabilities, enabling advanced traffic management, security, and observability.

- **Observability (Prometheus and Grafana)**: Prometheus and Grafana are integrated to provide monitoring and observability insights into the microservice and infrastructure.

## Getting Started

To explore and replicate this showcase, follow the steps in each directory's README file.

Feel free to reach out if you have any questions or if you'd like to discuss the implementation details. Enjoy exploring this demonstration of DevOps and SRE practices!
