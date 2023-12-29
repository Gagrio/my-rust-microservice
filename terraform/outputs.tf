# outputs.tf

output "gke_cluster_name" {
  value = module.gke_autopilot.cluster_name
}

output "gke_cluster_endpoint" {
  value = module.gke_autopilot.endpoint
}

output "gke_kubeconfig" {
  value = module.gke_autopilot.kubeconfig
}
