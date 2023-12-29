# main.tf

provider "google" {
  credentials = file("path/to/your/credentials.json")
  project     = "your-gcp-project-id"
  region      = "us-central1"
}

module "project" {
  source          = "terraform-google-modules/project-factory/google"
  project_id      = "your-gcp-project-id"
  org_id          = "your-gcp-organization-id"
  random_project_id = true
}

module "network" {
  source              = "terraform-google-modules/network/google"
  project_id          = module.project.project_id
  network_name        = "my-vpc"
  auto_create_subnetworks = false
  subnets = {
    my_subnet = {
      ip_cidr_range = "10.0.1.0/24"
      region        = "us-central1"
    }
  }
}

module "gke_autopilot" {
  source               = "terraform-google-modules/kubernetes-engine/google//modules/autopilot"
  project_id           = module.project.project_id
  cluster_name         = "my-gke-cluster"
  location             = "us-central1"
  network              = module.network.network_name
  subnetwork           = module.network.subnets.my_subnet.name
  net_admin            = true  # Add the new option here if available

  // Other configuration options...
}

module "container_registry" {
  source               = "terraform-google-modules/container-registry/google"
  project_id           = module.project.project_id
  location             = "us-central1"
  repository_name      = "my-container-repo"
}
