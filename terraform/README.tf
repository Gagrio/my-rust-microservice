# Terraform Infrastructure

This directory contains the Terraform code for creating a cloud environment on Google Cloud Platform (GCP), including a GCP project, a GKE cluster, and a Google Container Registry.

## Terraform Files

### main.tf

The `main.tf` file contains the primary Terraform configuration for provisioning GCP resources. It includes the definition of the Google provider, modules for project creation, network setup, GKE Autopilot cluster, and the Google Container Registry.

### providers.tf

The `providers.tf` file specifies additional Terraform providers. In this case, it includes the Helm provider, which is used for deploying Helm charts.

### helm.tf

The `helm.tf` file contains configurations for deploying Helm charts. It includes resources for deploying Helm releases, such as the `myapp` Helm chart and the `istio` Helm chart for Service Mesh capabilities.

### outputs.tf

The `outputs.tf` file defines outputs to provide clarity after Terraform execution. It includes outputs for referencing the GKE Autopilot cluster details, such as the cluster name, cluster endpoint, and kubeconfig.

For specific details on configuration and customization, refer to individual files.

Feel free to reach out if you have any questions or need further assistance.
