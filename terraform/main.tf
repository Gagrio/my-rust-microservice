# main.tf

module "project" {
  source          = "terraform-google-modules/project-factory/google"
  project_id      = "your-gcp-project-id"
  org_id          = "your-gcp-organization-id"
  random_project_id = true
}

module "network" {
  source              = "terraform-google-modules/network/google"
  project_id          = module.project.project_id
  network_name        = "myapp-vpc"
  auto_create_subnetworks = false
  subnets = {
    my_subnet = {
      ip_cidr_range = "10.0.1.0/24"
      region        = "europe-west1"  # Change this to your desired region in Europe
    }
  }
}

module "gke_autopilot" {
  source               = "github.com/terraform-google-modules/terraform-google-kubernetes-engine//modules/beta-autopilot-public-cluster?ref=main"
  project_id           = module.project.project_id
  cluster_name         = "myapp-gke-cluster"
  location             = "europe-west1"  # Change this to your desired region in Europe
  network              = module.network.network_name
  subnetwork           = module.network.subnets.my_subnet.name
  net_admin            = true  # Add the new option here if available

  # Other configuration options...

  outputs = {
    cluster_name     = module.gke_autopilot.cluster_name
    cluster_endpoint = module.gke_autopilot.endpoint
    kubeconfig       = module.gke_autopilot.kubeconfig
  }
}

module "container_registry" {
  source               = "terraform-google-modules/container-registry/google"
  project_id           = module.project.project_id
  location             = "europe-west1"  # Change this to your desired region in Europe
  repository_name      = "myapp-container-repo"
}
