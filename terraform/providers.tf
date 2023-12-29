# providers.tf

provider "google" {
  credentials = file("path/to/your/credentials.json")
  project     = "your-gcp-project-id"
  region      = "europe-west1"  # Change this to your desired region in Europe
}

provider "helm" {
  version    = ">= 2.5.0"
  kubeconfig = module.gke_autopilot.kubeconfig
}

provider "kubernetes" {
  version    = ">= 2.7.0"
  kubeconfig = module.gke_autopilot.kubeconfig
}
