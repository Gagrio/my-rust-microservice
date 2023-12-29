# DevOps and SRE Showcase: Rust Microservice on GKE

Welcome to my DevOps and Site Reliability Engineering (SRE) showcase repository! This project serves as a demonstration of my skills in orchestrating and managing cloud infrastructure for microservices, showcasing various DevOps practices.

## Overview

This repository showcases the deployment and operation of a Rust microservice on Google Cloud Platform (GCP). The architecture includes a GCP project, a GKE cluster, and a Google Container Registry, all managed and provisioned using Terraform.

## Repository Structure

- **src**: Contains the source code for a Rust microservice.
  
- **terraform**: Terraform (HCL) code for provisioning GCP resources, including a GKE cluster and a Google Container Registry.

- **helm**: Local Helm chart for packaging and deploying the Rust microservice.

- **helm-values**: Helm values files used during deployment via the Terraform Helm provider.

- **.github/workflows**: GitHub Actions workflows for automating tasks such as Terraform deployment, Docker image creation and push, and Helm-based application deployment.

- **DOCKERFILE**: Configuration for building a Docker container for the microservice.

## Demo Highlights

### Rust Microservice

The `src` directory hosts the source code for a Rust microservice. It showcases my proficiency in application development with Rust.

### Terraform Infrastructure

The `terraform` directory demonstrates the infrastructure-as-code approach using Terraform. It provisions a GCP project, a GKE cluster, and a Google Container Registry to facilitate the deployment of the Rust microservice.

### Helm Chart

The `helm` directory contains a Helm chart for packaging and deploying the Rust microservice. Helm enables easy configuration and versioning of the application.

### GitHub Actions Workflows

The `.github/workflows` directory houses various GitHub Actions workflows to automate key aspects of the software development lifecycle. Workflows include infrastructure deployment, Docker image creation, and application deployment with Helm.

### DevOps Capabilities

- **Service Mesh with Istio**: The GKE cluster is configured with Istio for Service Mesh capabilities, offering advanced traffic management, security, and observability.

- **Observability with Prometheus and Grafana**: Prometheus and Grafana are integrated to provide monitoring and observability insights into the Rust microservice and the underlying infrastructure.

## Getting Started

Explore each directory for detailed instructions on setting up and replicating the showcase. Feel free to reach out for discussions or questions about the showcased DevOps and SRE practices.

Enjoy navigating this demonstration of orchestrating a Rust microservice on GCP with DevOps excellence!
