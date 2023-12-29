# main.tf

provider "google" {
  credentials = file("path/to/your/credentials.json")
  project     = "your-gcp-project-id"
  region      = "europe-west1"
}

provider "helm" {
  version    = ">= 2.5.0"
  kubeconfig = module.gke_autopilot.kubeconfig
}

provider "kubernetes" {
  version    = ">= 2.7.0"
  kubeconfig = module.gke_autopilot.kubeconfig
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
  network_name        = "myapp-vpc"
  auto_create_subnetworks = false
  subnets = {
    my_subnet = {
      ip_cidr_range = "10.0.1.0/24"
      region        = "europe-west1"
    }
  }
}

module "gke_autopilot" {
  source               = "github.com/terraform-google-modules/terraform-google-kubernetes-engine//modules/beta-autopilot-public-cluster?ref=main"
  project_id           = module.project.project_id
  cluster_name         = "myapp-gke-cluster"
  location             = "europe-west1" 
  network              = module.network.network_name
  subnetwork           = module.network.subnets.my_subnet.name
  net_admin            = true  # To allow for Istio setup

  outputs = {
    cluster_name     = module.gke_autopilot.cluster_name
    cluster_endpoint = module.gke_autopilot.endpoint
    kubeconfig       = module.gke_autopilot.kubeconfig
  }
}

module "container_registry" {
  source               = "terraform-google-modules/container-registry/google"
  project_id           = module.project.project_id
  location             = "europe-west1"
  repository_name      = "myapp-container-repo"
}

resource "helm_release" "myapp" {
  name      = "myapp"
  namespace = "default"
  chart     = "./helm"
  values    = ["./helm-values/myapp.yaml"]
}

resource "helm_release" "istio-base" {
  name      = "istio-base"
  namespace = "istio-system"
  chart     = "istio-base"
  values    = ["./helm-values/istio-base.yaml"]
}

resource "helm_release" "istiod" {
  name      = "istiod"
  namespace = "istio-system"
  chart     = "istiod"
  values    = ["./helm-values/istiod.yaml"]
}

resource "helm_release" "istio-gateway" {
  name      = "istio-gateway"
  namespace = "istio-system"
  chart     = "istio-ingressgateway"
  values    = ["./helm-values/istio-gateway.yaml"]
}

output "gke_cluster_name" {
  value = module.gke_autopilot.cluster_name
}

output "gke_cluster_endpoint" {
  value = module.gke_autopilot.endpoint
}

output "gke_kubeconfig" {
  value = module.gke_autopilot.kubeconfig
}
